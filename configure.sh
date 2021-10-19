#!/bin/bash

export JETBOT_VERSION=0.4.3

L4T_VERSION_STRING=$(head -n 1 /etc/nv_tegra_release)
L4T_RELEASE=$(echo $L4T_VERSION_STRING | cut -f 2 -d ' ' | grep -Po '(?<=R)[^;]+')
L4T_REVISION=$(echo $L4T_VERSION_STRING | cut -f 2 -d ',' | grep -Po '(?<=REVISION: )[^;]+')

export L4T_VERSION="32.5.0"

if [[ "$L4T_VERSION" == "32.4.3" ]]
then
    # docker hub
    export JETBOT_DOCKER_REMOTE=jetbot
elif [[ "$L4T_VERSION" == "32.5.0" ]]
then
    export JETBOT_DOCKER_REMOTE=jetbot
    JETBOT_BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.4.4-pth1.6-py3
fi

./set_nvidia_runtime.sh
sudo systemctl enable docker

# check system memory
SYSTEM_RAM_KILOBYTES=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)

if [ $SYSTEM_RAM_KILOBYTES -gt 3000000 ]
then
    export JETBOT_JUPYTER_MEMORY=500m
    export JETBOT_JUPYTER_MEMORY_SWAP=3G
fi



