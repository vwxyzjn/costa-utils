# costa-utils

This repo contains some personal utilities to do quick things. Currently we have utils to help visualize Hugging Face's preference and SFT datasets.


# Get started

First you need to run `pip install costa_utils`.


Visualizing an HF SFT dataset:

```bash
# visualizing https://huggingface.co/datasets/allenai/tulu-v2-sft-mixture
python -m costa_utils.hf_viz \
    --sft trl-internal-testing/tldr-preference-sft-trl-style \
    --split train \
    --sft_messages_column_name messages
python -m costa_utils.hf_viz \
    --sft allenai/WildChat-1M \
    --split train \
    --sft_messages_column_name conversation


python -m costa_utils.hf_viz \
    --sft ai2-adapt-dev/math_ground_truth \
    --split train \
    --sft_messages_column_name messages


python -m costa_utils.hf_viz \
    --sft ai2-adapt-dev/tulu_hard_coded_repeated_10 \
    --split train \
    --sft_messages_column_name messages
```



| Before      | After |
| ----------- | ----------- |
| ![](static/sft_hf.png)      | ![](static/sft.png)       |


Visualizing an HF preference dataset:

```bash
# visualizing https://huggingface.co/datasets/HuggingFaceH4/ultrafeedback_binarized
python -m costa_utils.hf_viz \
    --preference ai2-adapt-dev/DaringAnteater-prefs-RM-filter \
    --split train \
    --preference_chosen_column_name chosen \
    --preference_rejected_column_name rejected
python -m costa_utils.hf_viz \
    --preference ai2-adapt-dev/numina_math_gsm8k_minerva_RM \
    --split train \
    --preference_chosen_column_name chosen \
    --preference_rejected_column_name rejected
```



| Before      | After |
| ----------- | ----------- |
| ![](static/pref_hf.png)     | ![](static/pref.png)      |




Bonus: it supports markdown too via `--markdown` with automatic syntax highlighting, thanks to rich's markdown integration.

```bash
python -m costa_utils.hf_viz \
    --sft AI-MO/NuminaMath-TIR \
    --split train \
    --sft_messages_column_name messages \
    --markdown
```





| Before      | After |
| ----------- | ----------- |
| ![](<static/math_and_code_hf.png>)   | ![](<static/math_and_code_markdown.png>)      |





```bash
python -m costa_utils.hf_duplicate \
    --src_model_id vwxyzjn/reward_modeling__EleutherAI_pythia-1b-deduped \
    --src_revision reward_modeling__1__1722961506 \
    --dst_model_id cleanrl/reward_modeling__EleutherAI_pythia-1b-deduped_sentiment \
    --lm_type rm
python -m costa_utils.hf_duplicate \
    --src_model_id vwxyzjn/reward_modeling__allenai_llama-3-tulu-2-8b \
    --src_revision reward_modeling__1__1723404196 \
    --dst_model_id allenai/reward_modeling__allenai_llama-3-tulu-2-8b_ultrafeedback \
    --lm_type rm
python -m costa_utils.hf_duplicate \
    --src_model_id vwxyzjn/online_dpo_vllm__allenai_llama-3-tulu-2-8b \
    --src_revision online_dpo_vllm__1__1723908605 \
    --dst_model_id vwxyzjn/online_dpo_tulu_2 \
    --no_private \
    --no_try_safetensors
python -m costa_utils.hf_duplicate \
    --src_model_id allenai/open_instruct_dev  \
    --src_revision dpo_tune___model__42__1725472620 \
    --dst_model_id ai2-adapt-dev/dpo_tune___model__42__1725472620 \
python -m costa_utils.hf_duplicate \
    --src_model_id allenai/open_instruct_dev  \
    --src_revision finetune_keith_llama3.2_1B__meta-llama_Llama-3.2-1B__42__1729880809 \
    --dst_model_id vwxyzjn/keith-llama3.2_1B_eos \
```

    --model_name_or_path allenai/open_instruct_dev \
    --revision dpo_tune___model__42__1725472620 \
## dev note

It's simple to debug. Just replace `python -m costa_utils.hf_viz` with `python costa_utils/hf_viz.py`

```bash
python -m costa_utils.hf_viz \
    --preference HuggingFaceH4/ultrafeedback_binarized \
    --split train_prefs \
    --preference_chosen_column_name chosen \
    --preference_rejected_column_name rejected
```
