#!/bin/bash

sudo docker run \
    --rm \
    -it \
    --name jetson-cozmars \
    --volume ${PWD}/../cozmars:/opt/cozmars \
    --workdir /opt/cozmars \
    cozmars:1.0 \
    /bin/bash