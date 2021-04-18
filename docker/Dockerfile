ARG BASE_IMAGE="nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.6-py3"
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

# ====================
# INSTALL COMMON TOOLS
# ====================
RUN apt-get update && apt-get install -y net-tools vim cmake git wget

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

# ==============
# INSTALL OPENCV
# ==============
# This one is redundant but let's install it to not overwrite CUDA-enabled contrib version later
RUN apt install -y \
        tesseract-ocr \
        libtesseract-dev \
        libatlas-base-dev \
        libhdf5-dev \
        libhdf5-serial-dev \
        libatlas-base-dev \
        libqtgui4 \
        libqt4-test
RUN pip3 install opencv-python
COPY ${PWD}/wheels /wheels
RUN pip3 install /wheels/opencv_contrib_python-4.5.1.48-cp38-cp38-linux_aarch64.whl --verbose
RUN rm -rf /wheels

# ===============
# INSTALL COZMARS
# ===============
RUN apt install -y ffmpeg
RUN pip3 install rcute-cozmars

# Jupyter kernel might crash without it
ENV LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1