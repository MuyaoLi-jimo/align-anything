#!/usr/bin/env bash
#
# Copyright 2024 PKU-Alignment Team. All Rights Reserved.
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
# ==============================================================================

MODEL_NAME_OR_PATH="PKU-Alignment/AA-chameleon-7b-base" # model path

TRAIN_DATASETS="" # dataset path
TRAIN_DATA_FILES="" # dataset name

EVAL_DATASETS="" # dataset path
EVAL_DATA_FILES="" # dataset name

OUTPUT_DIR="../outputs/chameleon_rm" # output dir

# For wandb online logging
export WANDB_API_KEY=""

# Source the setup script
source ./setup.sh

# Execute deepspeed command
deepspeed \
     --master_port ${MASTER_PORT} \
     --module align_anything.trainers.text_image_to_text_image.rm \
     --model_name_or_path ${MODEL_NAME_OR_PATH} \
     --train_datasets ${TRAIN_DATASETS} \
     --train_data_files ${TRAIN_DATA_FILES} \
     --eval_datasets ${EVAL_DATASETS} \
     --eval_data_files ${EVAL_DATA_FILES} \
     --output_dir ${OUTPUT_DIR} \
     --save_interval 1000 \
     --epochs 2