#!/usr/bin/env bash


CHECKPOINT_PATH=$1
shift
SUFFIX=$1
shift

if [ -z "$SUFFIX" ]; then
    SUFFIX="hf"
fi

commands=(
    "pip install awscli"
    "git clone https://github.com/allenai/OLMo.git"
    "cd OLMo"
    "pip install -e '.[all]'"
    "python hf_olmo/convert_olmo_to_hf.py --checkpoint-dir '$CHECKPOINT_PATH'  --destination-dir '${CHECKPOINT_PATH}-${SUFFIX}' --keep-olmo-artifacts"
)


for cmd in "${commands[@]}"; do
  if [ -z "$joined_commands" ]; then
    joined_commands="$cmd"
  else
    joined_commands="$joined_commands && $cmd"
  fi
done

gantry run \
    --description "Converting ${CHECKPOINT_PATH}" \
    --allow-dirty \
    --no-python \
    --workspace ai2/oe-data \
    --priority high \
    --gpus 0 \
    --preemptible \
    --cluster 'ai2/*' \
    --budget ai2/oe-data \
    --env-secret AWS_ACCESS_KEY_ID=S2_AWS_ACCESS_KEY_ID \
    --env-secret AWS_SECRET_ACCESS_KEY=S2_AWS_SECRET_ACCESS_KEY \
    --shared-memory 10GiB \
    --yes \
    -- /bin/bash -c "${joined_commands}"