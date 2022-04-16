#!bin/bash


$LAYOUT_PATH= '../../../../../model'
mkdir model/output_files/
cd ./sub_utilities/src/network_wrapper/training/scripts/


python3 generate_csv.py xml $LAYOUT_PATH/annotations $LAYOUT_PATH/output_files/test_csv.csv
python3 generate_pbtxt.py csv $LAYOUT_PATH/output_files/test_csv.csv $LAYOUT_PATH/output_files/label_map.pbtxt
python3 generate_train_eval.py $LAYOUT_PATH/output_files/test_csv.csv 
python3 generate_tfrecord.py $LAYOUT_PATH/output_files/test_csv_train.csv $LAYOUT_PATH/output_files/label_map.pbtxt $LAYOUT_PATH/images/ $LAYOUT_PATH/output_files/example_train.record
python3 generate_tfrecord.py $LAYOUT_PATH/output_files/test_csv_eval.csv $LAYOUT_PATH/output_files/label_map.pbtxt $LAYOUT_PATH/images/ $LAYOUT_PATH/output_files/example_eval.record
