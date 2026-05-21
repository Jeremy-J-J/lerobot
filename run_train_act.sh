lerobot-train \
    --dataset.repo_id=dataset/test \
    --policy.type=act \
    --output_dir=outputs/train/act_so101_test \
    --job_name=act_so101_test \
    --policy.device=cpu \
    --wandb.enable=false \
    --policy.push_to_hub=false\
    --steps=300000
