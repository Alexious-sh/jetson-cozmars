#!/bin/bash

sudo docker build \
    -t cozmars-jupyter:1.0 \
    -f Dockerfile \
    ..  # repo root as context

