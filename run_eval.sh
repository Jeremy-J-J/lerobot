#!/usr/bin/env bash
set -euo pipefail

# The policy keeps trying the task for up to 10 minutes.
# Press Right Arrow when the grasp/place succeeds to end and save the episode.
# Press Esc or Ctrl+C to stop manually.
rm -rf ~/.cache/huggingface/lerobot/seeed/eval_test1

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyUSB0 \
    --robot.cameras="{ front: {type: opencv, index_or_path: 0, width: 640, height: 480, fps: 30, fourcc: "MJPG"}}" \
    --robot.id=my_awesome_follower_arm \
    --display_data=false \
    --dataset.repo_id=seeed/eval_test1 \
    --dataset.num_episodes=1 \
    --dataset.episode_time_s=600 \
    --dataset.reset_time_s=0 \
    --dataset.single_task="Grab the yellow toy duck and place it on the box" \
    --policy.path=/workspace/models/lerobot_model/train_v1/300000/last/pretrained_model
