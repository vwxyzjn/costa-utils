from dataclasses import dataclass
import json
import os

import numpy as np
import pandas as pd
from huggingface_hub import HfApi, snapshot_download
import tyro


api = HfApi()

repo_dir = "./evals/"


@dataclass
class Args:
    evals_repo: str = "allenai/tulu-3-evals"



def restart_space():
    api.restart_space(repo_id="allenai/tulu-3-leaderboard")


def export_to_csv(dataframe):
    """Export the given dataframe to a CSV file and return the file path."""
    csv_file = "exported_results.csv"
    dataframe.to_csv(csv_file, index=False)
    return csv_file


if __name__ == "__main__":
    args = tyro.cli(Args)
    print("Pulling evaluation results")
    repo = snapshot_download(
        local_dir=repo_dir,
        ignore_patterns=[],
        repo_id=args.evals_repo,
        tqdm_class=None,
        etag_timeout=30,
        repo_type="dataset",
    )