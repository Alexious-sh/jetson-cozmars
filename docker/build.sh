cp /etc/apt/trusted.gpg.d/jetson-ota-public.asc ../.. # copy to jetbot root

sudo docker build \
    --build-arg BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.6-py3 \
    -t cozmars:1.0 \
    -f Dockerfile \
    ..  # repo root as context

