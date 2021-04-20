ARG BASE_IMAGE="nvcr.io/nvidia/l4t-base:r32.5.0"
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

# ====================
# INSTALL COMMON TOOLS
# ====================
RUN apt-get update && apt-get install -y net-tools vim cmake git wget build-essential

# =======================
# INSTALL PYTHON 3.8 venv
# =======================
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update
RUN apt install -y python3.8 python3.8-venv python3.8-dev
ENV VIRTUAL_ENV=/opt/py3.8-env
RUN python3.8 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip3 install --upgrade pip setuptools cython wheel

# ================
# INSTALL LLVMLITE
# ================
RUN apt install -y --no-install-recommends llvm-9 llvm-9-dev
ENV LLVM_CONFIG=/usr/bin/llvm-config-9
RUN pip3 install llvmlite

# =====================================
# INSTALL OPENCV & REST PREBUILT WHEELS
# =====================================
RUN apt install -y \
        tesseract-ocr \
        libtesseract-dev \
        libatlas-base-dev \
        libhdf5-dev \
        libhdf5-serial-dev \
        libatlas-base-dev \
        libqtgui4 \
        libqt4-test
# This one is redundant but let's install it to not overwrite CUDA-enabled contrib version later
RUN pip3 install opencv-python
COPY ${PWD}/wheels /wheels
RUN pip3 install /wheels/*.whl --verbose
RUN rm -rf /wheels

# =====================
# INSTALL RCUTE-COZMARS
# =====================
RUN apt install -y ffmpeg
RUN pip3 install rcute-cozmars

# ================
# INSTALL RCUTE-AI
# ================
RUN apt install -y portaudio19-dev espeak libespeak1
RUN pip3 install https://github.com/alphacep/vosk-api/releases/download/0.3.21/vosk-0.3.21-py3-none-linux_aarch64.whl
RUN pip3 install rcute-ai
