rm -rf ~/.cache/huggingface/lerobot/seeed/eval_test1

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyUSB0 \
    --robot.cameras="{ front: {type: opencv, index_or_path: 0, width: 640, height: 480, fps: 30, fourcc: "MJPG"}}" \
    --robot.id=my_awesome_follower_arm \
    --display_data=false \
    --dataset.repo_id=seeed/eval_test1 \
    --dataset.single_task="Grab the yellow toy duck and place it on the box" \
    --policy.path=/workspace/pro/lerobot/lerobot-main/output/train_v1/200000/pretrained_model