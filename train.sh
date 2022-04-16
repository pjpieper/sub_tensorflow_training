#!/bin/bash

echo "Making folders"
mkdir training
mkdir training/data

echo "Copying model setup to training folder"
cp ./model/output_files/label_map.pbtxt ./training/data/
cp ./model/output_files/example_train.record ./training/data/
cp ./model/output_files/example_eval.record ./training/data/
cp ./train.config ./training/


echo "Moving Training folder to setup training"
cp -a ./training/ ./sub_utilities/src/network_wrapper/tf_tft_models/third_party/models/research/object_detection/legacy/
cd ./sub_utilities/src/network_wrapper/tf_tft_models/third_party/models/research/object_detection/legacy/

echo "Beginning Training"
python3 train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/train.config