#!/bin/bash

#Install necessary tools
echo "Installing Git and FFMPEG"
sudo apt install git ffmpeg

#Sub Utilities
echo "Downloading Sub Utilities and installing Network Wrapper"
git clone https://github.com/ksu-auv-team/sub_utilities/
cd sub_utilities/
git checkout network_wrapper_changes # Until it's merged into master
cd src/network_wrapper/
sh install.sh

cd ./tf_trt_models/third_party/models/research
sudo python3 setup.py build
sudo python3 setup.py install
cd ../../../../../../../

#labelImg
echo "Done with Network Wrapper. Downloading and Installing labelImg."
cd ../../..
git clone https://github.com/tzutalin/labelImg.git
cd labelImg
sudo apt install pyqt5-dev-tools
sudo pip3 install -r requirements/requirements-linux-python3.txt
make qt5py3
cd ../

#Notify completion
echo "Done!"
