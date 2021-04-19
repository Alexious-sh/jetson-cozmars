#!/bin/bash

sudo docker build \
    --build-arg BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.5.0 \
    -t cozmars:1.0 \
    -f Dockerfile \
    ..  # repo root as context
