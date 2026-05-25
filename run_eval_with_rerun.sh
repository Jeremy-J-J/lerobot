#!/usr/bin/env bash
set -euo pipefail

# Evaluation with Rerun visualization enabled.
# The policy keeps trying the task for up to 10 minutes.
# Press Right Arrow when the grasp/place succeeds to end and save the episode.
# Press Esc or Ctrl+C to stop manually.
#
# Rerun can freeze when it receives 640x480 images and scalar streams at high FPS.
# These settings reduce flush overhead while keeping image features available for
# the policy and dataset metadata.
export RERUN_FLUSH_NUM_BYTES="${RERUN_FLUSH_NUM_BYTES:-1048576}"
export LEROBOT_RERUN_MEMORY_LIMIT="${LEROBOT_RERUN_MEMORY_LIMIT:-25%}"

rm -rf ~/.cache/huggingface/lerobot/seeed/eval_test1

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyUSB0 \
    --robot.cameras="{ front: {type: opencv, index_or_path: 0, width: 640, height: 480, fps: 25, fourcc: "MJPG"}}" \
    --robot.id=my_awesome_follower_arm \
    --display_data=true \
    --dataset.repo_id=seeed/eval_test1 \
    --dataset.fps=10 \
    --dataset.num_episodes=1 \
    --dataset.episode_time_s=600 \
    --dataset.reset_time_s=0 \
    --dataset.single_task="Grab the yellow toy duck and place it on the box" \
    --policy.path=/workspace/models/lerobot_model/train_v1/300000/last/pretrained_model
