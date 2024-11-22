rm -rf tmpdir
mkdir tmpdir
beaker dataset fetch 01J7Q7G3MDVY46PW09YSQ6M47B -o tmpdir

huggingface-cli upload --private --revision online_dpo_vllm_thread_beta_0.03__1__1726282895 vwxyzjn/online_dpo_vllm_thread_beta_0.03__allenai_open_instruct_dev tmpdir .



https://beaker.org/ds//details

aws s3 cp s3://ai2-llm/checkpoints/OLMo-medium/peteish7-anneal-from-928646-50B-nowup-dclm07-flan/step11931-unsharded-hf/ . --recursive
aws cp s3://ai2-llm/checkpoints/OLMo-medium/peteish7-anneal-from-928646-50B-nowup-dclm07-flan/step11931-unsharded


bash convert_checkpoint.sh s3://ai2-llm/checkpoints/OLMo-medium/peteish7-anneal-from-928646-50B-nowup-dclm07-flan/step11931-unsharded


huggingface-cli upload --private ai2-adapt-dev/OLMo-medium-peteish7-anneal-from-928646-50B-nowup-dclm07-flan test .


huggingface-cli download --local-dir val --revision online_dpo_math_gsm8k_math_rm_t_0.7_jacob_final_sft_dpo_model__3__1730147988 valpy/online_dpo_math_gsm8k_math_rm_t_0.7_jacob_final_sft_dpo_model___model 

https://huggingface.co/allenai/open_instruct_dev/tree/


exp_name=valpy_dpo_70b_hslj_uflj_dalj_wciflj_iftaxlj_wcunlj_op___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed___42__1731270071
huggingface-cli download --local-dir valpy_dpo_70b_hslj_uflj_dalj_wciflj_iftaxlj_wcunlj_op --revision $exp_name allenai/open_instruct_dev 



beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix config.json -o tmpdir2
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix generation_config.json  -o tmpdir2
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00001-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00002-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00003-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00004-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00005-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00006-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00007-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00008-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00009-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00010-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00011-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00012-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00013-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00014-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00015-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00016-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00017-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00018-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00019-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00020-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00021-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00022-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00023-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00024-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00025-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00026-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00027-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00028-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00029-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model-00030-of-00030.safetensors -o tmpdir2 --concurrency 32
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix model.safetensors.index.json  -o tmpdir2
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix special_tokens_map.json  -o tmpdir2
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix tokenizer.json  -o tmpdir2
beaker dataset fetch 01JBJRBE3PP689W35NAXCFN254 --prefix tokenizer_config.json  -o tmpdir2


huggingface-cli upload  --revision 70B_ppo_ray_β_0.07_lr_1e-7__3__1730427622 allenai/open_instruct_dev tmpdir2 .
huggingface-cli download --local-dir ppo_70B2 --revision 70B_ppo_ray_β_0.07_lr_1e-7__3__1730427622 allenai/open_instruct_dev 




huggingface-cli download --local-dir peteish7-weka-anneal-from-928646-50B-nowup_big-number-no-whammy-2_soup_step11931_hf --revision peteish7-weka-anneal-from-928646-50B-nowup_big-number-no-whammy-2_soup_step11931_hf allenai/open_instruct_dev 



huggingface-cli download --local-dir Llama-3.1-Tulu-3-70B-rc0-direct-upload_backup allenai/Llama-3.1-Tulu-3-70B-rc0-direct-upload

https://huggingface.co/allenai/open_instruct_dev/tree/


huggingface-cli download --local-dir valpy_dpo_70b_hslj_uflj_dalj_wciflj_iftaxlj_wcunusedlj --revision valpy_dpo_70b_hslj_uflj_dalj_wciflj_iftaxlj_wcunusedlj___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed___42__1730756396 allenai/open_instruct_dev 
https://huggingface.co/allenai/open_instruct_dev/tree/

for exp_name, dataset_id in [(ppo_ray_β_0.1__3__1730357576, 01JBGKWNT2DKZXC6NX0476Z9W7), (ppo_ray_β_0.01__3__32137576, 01JBGKWdsZXC6NX0476Z9W7)]
do
rm-rf tmpdir3 && mkdir tmpdir3
beaker dataset fetch $dataset_id config.json -o tmpdir3
beaker dataset fetch $dataset_id generation_config.json -o tmpdir3
beaker dataset fetch $dataset_id model-00001-of-00004.safetensors -o tmpdir3
beaker dataset fetch $dataset_id model-00002-of-00004.safetensors -o tmpdir3
beaker dataset fetch $dataset_id model-00003-of-00004.safetensors -o tmpdir3
beaker dataset fetch $dataset_id model-00004-of-00004.safetensors -o tmpdir3
beaker dataset fetch $dataset_id model.safetensors.index.json -o tmpdir3
beaker dataset fetch $dataset_id special_tokens_map.json -o tmpdir3
beaker dataset fetch $dataset_id tokenizer.json -o tmpdir3
beaker dataset fetch $dataset_id tokenizer_config.json -o tmpdir3
push_to $exp_name
done


declare -A experiments=(
    ["ppo_ray_rm_init_use_rm_β_0.1__3__1730852970"]="01JBZDWFDPZHS84FWZ5SC2YZD5"
    ["ppo_ray_rm_init_use_rm_β_0.03__3__1730852970"]="01JBZDWGN2HCG9EYR9D12QGM6W"
    ["ppo_ray_rm_init_use_rm_β_0.01__3__1730852980"]="01JBZDWHZYE1KBF96MNASPYQFX"
    ["ppo_ray_rm_init_use_rm_β_0.001__3__1730853010"]="01JBZDWMGB8GPGPS884PW99TFW"
    ["ppo_ray_rm_init_use_rm_β_0.05__3__1730852972"]="01JBZDWE2VSMFKE7JBKQMHPNG5"
)
for exp_name in "${!experiments[@]}"; do
    dataset_id="${experiments[$exp_name]}"
    
    mkdir $exp_name
    
    # List of files to fetch
    files=(
        "config.json"
        "generation_config.json"
        "model-00001-of-00004.safetensors"
        "model-00002-of-00004.safetensors"
        "model-00003-of-00004.safetensors"
        "model-00004-of-00004.safetensors"
        "model.safetensors.index.json"
        "special_tokens_map.json"
        "tokenizer.json"
        "tokenizer_config.json"
    )
    
    # Fetch each file
    for file in "${files[@]}"; do
        beaker dataset fetch "$dataset_id" --prefix "$file" -o $exp_name --concurrency 64
    done
    
    huggingface-cli upload --private --revision $exp_name allenai/open_instruct_dev $exp_name .
done


declare -A experiments=(
    ["ppo_ray_rm_init_use_rm_β_0.1__3__1730852970"]="01JBZDWFDPZHS84FWZ5SC2YZD5"
    ["ppo_ray_rm_init_use_rm_β_0.03__3__1730852970"]="01JBZDWGN2HCG9EYR9D12QGM6W"
    ["ppo_ray_rm_init_use_rm_β_0.01__3__1730852980"]="01JBZDWHZYE1KBF96MNASPYQFX"
    ["ppo_ray_rm_init_use_rm_β_0.001__3__1730853010"]="01JBZDWMGB8GPGPS884PW99TFW"
    ["ppo_ray_rm_init_use_rm_β_0.05__3__1730852972"]="01JBZDWE2VSMFKE7JBKQMHPNG5"
)
for exp_name in "${!experiments[@]}"; do
    dataset_id="${experiments[$exp_name]}"
    
    huggingface-cli download --local-dir $exp_name --revision $exp_name allenai/open_instruct_dev 
done


exp_name=OLMo-medium_peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2-se-flan-soup_step11931-hf
huggingface-cli upload --private --revision $exp_name allenai/open_instruct_dev step11931-hf .


https://huggingface.co/allenai/open_instruct_dev/tree/OLMo-medium_peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2-se-flan-soup_step11931-hf/
exp_name=OLMo-medium_peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2-se-flan-soup_step11931-hf
huggingface-cli download --local-dir $exp_name --revision $exp_name allenai/open_instruct_dev 


huggingface-cli upload --private --revision 70B_ppo_ray_β_0.04_lr_1e-7__3__1730743266 allenai/open_instruct_dev ppo_70B .



huggingface-cli upload --private --revision valpy_dpo_70b_hslj_uflj_wcunusedlj_sftunused_ifpersfaeze___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed___42__1730917605 allenai/open_instruct_dev ppo_70B .


huggingface-cli download --local-dir $exp_name --revision $exp_name allenai/open_instruct_dev 





declare -A experiments=(
    ["ppo_ray_3.9_1109_β_0.05__3__1731206790"]="01JC9Z9X8BYAPYND454ZC8S98S"
)
for exp_name in "${!experiments[@]}"; do
    dataset_id="${experiments[$exp_name]}"
    
    mkdir $exp_name
    
    # List of files to fetch
    files=(
        "config.json"
        "generation_config.json"
        "model-00001-of-00004.safetensors"
        "model-00002-of-00004.safetensors"
        "model-00003-of-00004.safetensors"
        "model-00004-of-00004.safetensors"
        "model.safetensors.index.json"
        "special_tokens_map.json"
        "tokenizer.json"
        "tokenizer_config.json"
    )
    
    # Fetch each file
    for file in "${files[@]}"; do
        beaker dataset fetch "$dataset_id" --prefix "$file" -o $exp_name --concurrency 64
    done
    
    huggingface-cli upload --private --revision $exp_name allenai/open_instruct_dev $exp_name .
done

declare -A experiments=(
    ["ppo_ray_3.9_1109_β_0.07__3__1731200612"]="01JC9SB0QH0N4J2H5TYV35Y63A"
    ["ppo_ray_3.9_1109_β_0.1__3__1731200625"]="01JC9SB6WAYHA1NGWQWTCK0JTZ"
    ["ppo_ray_3.9_1109_β_0.03__3__1731200865"]="01JC9SB84HED21W1MJBE8RBYDW"
    ["ppo_ray_3.9_1109_β_0.05__3__1731206790"]="01JC9Z9X8BYAPYND454ZC8S98S"
)
for exp_name in "${!experiments[@]}"; do
    dataset_id="${experiments[$exp_name]}"
    
    huggingface-cli download --local-dir $exp_name --revision $exp_name allenai/open_instruct_dev 
done



exp_name=70B_ppo_ray_β_0.07_lr_1e-7__3__1730952648
huggingface-cli download --local-dir $exp_name --revision $exp_name allenai/open_instruct_dev 



huggingface-cli upload --private --revision peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2 allenai/open_instruct_dev model.pt model.pt
huggingface-cli upload --private --revision peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2 allenai/open_instruct_dev config.yaml config.yaml


huggingface-cli download --local_dir peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2 --revision peteish7-anneal-from-928646-50B-nowup-moremath-dclm07-fw2 allenai/open_instruct_dev


huggingface-cli download --local_dir /model --revision olmo1124_finetune2__allenai_open_instruct_dev__42__1731388853 allenai/open_instruct_dev


huggingface-cli upload --private --revision math_newer_model_rm_init_no_eos_checkpoints_step_400 allenai/open_instruct_dev /weka/oe-adapt-default/hamishi/model_checkpoints/math_newer_model_rm_init_no_eos_checkpoints/step_400 .



huggingface-cli download --local_dir model_tmp meta-llama/Llama-3.1-8B



exp_name=valpy_dpo_70b_best_nohs_ufljclean
huggingface-cli download --local-dir $exp_name --revision valpy_dpo_70b_best_nohs_ufljclean___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed___42__1731610986 allenai/open_instruct_dev 
exp_name=valpy_dpo_70b_best_lr2
huggingface-cli download --local-dir $exp_name --revision valpy_dpo_70b_best_lr2___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed___42__1731622042 allenai/open_instruct_dev 
exp_name=valpy_dpo_70b_best_jacobnew
huggingface-cli download --local-dir $exp_name --revision valpy_dpo_70b_best_jacobnew___oe-adapt-default_jacobm_tulu-3-dev_checkpoints_base_models_L3.1-70B-v3.9-nc-2e-6-2_ep-fixed-3___42__1731722347 allenai/open_instruct_dev 
