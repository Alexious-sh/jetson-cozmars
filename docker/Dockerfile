ARG BASE_IMAGE="nvcr.io/nvidia/l4t-base:r32.6.1"
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
RUN ln -sf /usr/bin/python3.8-config /usr/bin/python3-config
ENV VIRTUAL_ENV=/opt/py3.8-env
RUN python3.8 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip3 install --upgrade pip setuptools cython wheel

# ================
# INSTALL LLVMLITE
# ================
RUN apt update && apt install -y --no-install-recommends llvm-9 llvm-9-dev
ENV LLVM_CONFIG=/usr/bin/llvm-config-9
RUN pip3 install llvmlite

# =====================================
# INSTALL OPENCV & REST PREBUILT WHEELS
# =====================================
RUN apt update && apt install -y \
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
RUN apt update && apt install -y ffmpeg
RUN pip3 install rcute-cozmars

# ===============
# INSTALL SNOWBOY
# ===============
RUN apt update && apt install -y libpcre3 libpcre3-dev portaudio19-dev
RUN wget http://downloads.sourceforge.net/swig/swig-3.0.10.tar.gz
RUN tar -xvzf swig-3.0.10.tar.gz
WORKDIR swig-3.0.10
RUN ./configure --prefix=/usr \
                --without-clisp \
                --without-maximum-compile-warnings
RUN make
RUN make install
RUN install -v -m755 -d /usr/share/doc/swig-3.0.10
RUN cp -v -R Doc/* /usr/share/doc/swig-3.0.10
WORKDIR ..
RUN git clone https://github.com/Kitt-AI/snowboy.git
WORKDIR snowboy/swig/Python3
RUN sed -i 's+lib/ubuntu64/libsnowboy-detect.a+lib/aarch64-ubuntu1604/libsnowboy-detect.a+g' Makefile
RUN make
WORKDIR ../..
RUN pip install .
WORKDIR ..

# ================
# INSTALL RCUTE-AI
# ================
RUN apt update && apt install -y espeak libespeak1
RUN pip3 install https://github.com/alphacep/vosk-api/releases/download/0.3.21/vosk-0.3.21-py3-none-linux_aarch64.whl
#RUN pip3 install rcute-ai
RUN git clone https://github.com/r-cute/rcute-ai.git
WORKDIR rcute-ai
RUN pip3 install .
WORKDIR ..
