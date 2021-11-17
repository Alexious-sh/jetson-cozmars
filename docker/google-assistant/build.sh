#!/bin/bash

sudo docker build \
    -t cozmars-google-assistant:1.0 \
    -f Dockerfile \
    ../..  # repo root as context

