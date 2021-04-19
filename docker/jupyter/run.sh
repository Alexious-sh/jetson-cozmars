#!/bin/bash

sudo docker run \
    --rm \
    -d \
    --name jetson-cozmars-jupyter \
    -p 8888:8888 \
    --volume ${PWD}/../../cozmars:/opt/cozmars \
    --workdir /opt/cozmars \
    cozmars-jupyter:1.0