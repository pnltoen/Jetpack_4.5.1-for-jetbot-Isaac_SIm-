cp /etc/apt/trusted.gpg.d/jetson-ota-public.asc ../.. # copy to jetbot root

if [[ "$L4T_VERSION" == "32.4.3" ]]
then
    BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.4.3-pth1.6-py3
elif [[ "$L4T_VERSION" == "32.4.4" ]]
then
    BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.4.4-pth1.6-py3
elif [[ "$L4T_VERSION" == "32.5.0" ]]
then
    BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.6-py3
fi

sudo docker build \
    --build-arg BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.6py3 \
    -t $JETBOT_DOCKER_REMOTE/jetbot:base-0.4.3-32.5.0 \
    -f Dockerfile \
    ../..  # jetbot repo root as context

