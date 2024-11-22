# Modified from the h4 codebase with permission from Ed and Lewis
# coding=utf-8
# Copyright 2023 The HuggingFace Team. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
Script to create a duplicate of a Hub model with a given revision (e.g. branch name).

This is useful when:

- You want to create a model for a public release with a dedicated model repository.
- You want to deploy a model on the Inference API with a custom config (see e.g. https://github.com/huggingface/api-inference/pull/1486)
"""
from dataclasses import dataclass
import os
import shutil
from pathlib import Path
from typing import Literal

import tyro
from huggingface_hub import create_repo, snapshot_download, upload_folder, HfApi

api = HfApi()

@dataclass
class Args:
    src_model_id: str
    """the source hf repo id"""
    src_revision: str
    """the source hf repo revision"""
    dst_model_id: str
    """the destination hf repo id"""
    dst_revision: str = "main"
    """the destination hf repo revision (default: main)"""
    lm_type: Literal["causal", "rm"] = "causal"
    """the type of language model"""
    private: bool = True
    """whether the destination repo should be private"""
    trust_remote_code: bool = False
    """whether to trust the remote code"""
    try_safetensors: bool = True
    """whether to try to convert the checkpoint to safetensors"""


if __name__ == "__main__":
    args = tyro.cli(Args)
    if args.dst_model_id is None:
        args.dst_model_id = f"{args.x}-{args.src_revision.replace('.', '')}-deploy"

    model_name = args.src_model_id.split("/")[-1]
    # Periods aren't allowed in repo names, so we replace them with dashes
    src_dir = Path(f"data/{model_name}-{args.src_revision}".replace(".", "-"))
    src_dir.mkdir(parents=True, exist_ok=True)
    print(f"Created source repo folder at {src_dir}")


    src_repo_path = snapshot_download(
        repo_id=args.src_model_id, revision=args.src_revision, local_dir=src_dir, ignore_patterns="checkpoint-*"
    )
    print(f"Downloaded source repo at {src_repo_path}")
    filenames = os.listdir(src_repo_path)
    if any(".safetensors" in file for file in filenames):
        print("Model already has safetensors. Skipping conversion.")
    elif args.try_safetensors:
        print("Model does not have safetensors. Converting checkpoint ...")
        import torch
        from transformers import AutoModelForCausalLM, AutoModelForSequenceClassification

        if args.lm_type == "rm":
            model = AutoModelForSequenceClassification.from_pretrained(
                args.src_model_id, torch_dtype=torch.bfloat16, revision=args.src_revision, trust_remote_code=args.trust_remote_code, num_labels=1,
            )
        else:
            model = AutoModelForCausalLM.from_pretrained(
                src_dir, device_map="auto", torch_dtype=torch.bfloat16, trust_remote_code=args.trust_remote_code
            )
        model.save_pretrained(src_dir)
        print("Converted checkpoint to safetensors.")

        if os.path.exists(os.path.join(src_repo_path, "pytorch_model.bin")):
            os.remove(os.path.join(src_repo_path, "pytorch_model.bin"))
            print("Deleted pytorch_model.bin")

        # or delete pytorch_model-00001-of-0000N.bin files
        for file in filenames:
            if "pytorch_model-" in file:
                os.remove(os.path.join(src_repo_path, file))
                print(f"Deleted {file}")
    else:
        print("Model does not have safetensors, due to the try_safetensors flag being set to False. Skipping conversion.")

    repo_url = create_repo(repo_id=args.dst_model_id, private=args.private, exist_ok=True)
    print(f"Created target repo at {repo_url}")

    print("Pushing to the Hub ...")
    upload_folder(
        repo_id=args.dst_model_id,
        revision=args.dst_revision,
        folder_path=src_repo_path,
        commit_message=f"Add {args.src_model_id}-{args.src_revision} checkpoint",
        ignore_patterns="checkpoint-*",
    )

    print(f"Done! You can now access the model at https://huggingface.co/{args.dst_model_id}")

    # Clean up
    shutil.rmtree(src_dir)

