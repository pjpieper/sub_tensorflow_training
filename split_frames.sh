#!/bin/bash

mkdir ./model
mkdir ./model/images
./sub_utilities/src/network_wrapper/training/scripts/split.sh $1 $2 ./model/images
