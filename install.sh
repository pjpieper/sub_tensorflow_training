#!/bin/bash

#Install necessary tools
echo "Installing Git and FFMPEG"
sudo apt install git ffmpeg

echo "Downloading Sub Utilities and installing Network Wrapper"
git clone https://github.com/ksu-auv-team/sub_utilities/
cd sub_utilities/
git checkout network_wrapper_changes # Until it's merged into master


cd src/network_wrapper/

sh install.sh


cd ../../..
git clone https://github.com/tzutalin/labelImg.git
cd labelImg
pip3 install pyqt5 lxml
make qt5py3

