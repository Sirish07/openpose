#!/bin/bash

### INSTALL PREREQUISITES

UBUNTU_VERSION="$(lsb_release -r)"

# Basic
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install build-essential
# General dependencies
sudo apt-get --assume-yes install libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get --assume-yes install --no-install-recommends libboost-all-dev
# Remaining dependencies
sudo apt-get --assume-yes install libgflags-dev libgoogle-glog-dev
# LMDB is needed for Caffe training, but very likely not for inference-only
sudo apt-get --assume-yes install liblmdb-dev

# Python3 libs
echo "Installing Python3 libs..."
sudo apt-get --assume-yes install python3-setuptools python3-dev build-essential
hash pip3 2> /dev/null || sudo apt-get --assume-yes install python3-pip
sudo -H python3 -m pip install pip --upgrade
sudo -H python3 -m pip install --upgrade numpy protobuf opencv-python-headless

# OpenCL Generic (Official OpenPose support dropped after Ubuntu 20)
if [[ $UBUNTU_VERSION == *"14."* ]] || [[ $UBUNTU_VERSION == *"15."* ]] || [[ $UBUNTU_VERSION == *"16."* ]] || [[ $UBUNTU_VERSION == *"17."* ]] || [[ $UBUNTU_VERSION == *"18."* ]]; then
	sudo apt-get --assume-yes install opencl-headers ocl-icd-opencl-dev
	sudo apt-get --assume-yes install libviennacl-dev
fi
# OpenCV 2.4 -> Added as option
# # sudo apt-get --assume-yes install libopencv-dev
