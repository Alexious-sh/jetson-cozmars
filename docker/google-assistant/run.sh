#!/bin/bash

sudo docker run \
    --rm \
    -it \
    --name jetson-cozmars-assistant \
    --volume ${PWD}/../../cozmars:/opt/cozmars \
    --volume ${HOME}/.config/google-oauthlib-tool:/root/.config/google-oauthlib-tool \
    --volume ${HOME}/.config/googlesamples-assistant:/root/.config/googlesamples-assistant \
    --workdir /opt/cozmars/assistant-sdk-python/google-assistant-sdk/googlesamples/assistant/grpc \
    cozmars-google-assistant:1.0 \
    python3 pushtotalk.py