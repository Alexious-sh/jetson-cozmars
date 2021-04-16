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
RUN apt install -y python3.8 python3.8-venv python3.8-dev
ENV VIRTUAL_ENV=/opt/py3.8-env
RUN python3.8 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# ================
# INSTALL LLVMLITE
# ================
RUN apt install -y --no-install-recommends llvm-9 llvm-9-dev
RUN pip3 install --upgrade pip setuptools cython
RUN LLVM_CONFIG=/usr/bin/llvm-config-9 pip3 install llvmlite numba librosa

# ============
# BUILD OPENCV
# ============
RUN apt-get install -y \
        build-essential \
        cmake \
        git \
        gfortran \
        libatlas-base-dev \
        libavcodec-dev \
        libavformat-dev \
        libavresample-dev \
        libcanberra-gtk3-module \
        libdc1394-22-dev \
        libeigen3-dev \
        libglew-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-dev \
        libgstreamer1.0-dev \
        libgtk-3-dev \
        libjpeg-dev \
        libjpeg8-dev \
        libjpeg-turbo8-dev \
        liblapack-dev \
        liblapacke-dev \
        libopenblas-dev \
        libpng-dev \
        libpostproc-dev \
        libswscale-dev \
        libtbb-dev \
        libtbb2 \
        libtesseract-dev \
        libtiff-dev \
        libv4l-dev \
        libxine2-dev \
        libxvidcore-dev \
        libx264-dev \
        pkg-config \
        qv4l2 \
        v4l-utils \
        v4l2ucp \
        zlib1g-dev
#COPY ${PWD}/docker/nano_build_opencv.sh /opt/nano_build_opencv.sh
#RUN bash /opt/nano_build_opencv.sh
RUN git clone --recursive https://github.com/opencv/opencv-python.git
RUN ENABLE_CONTRIB=1 \
        CMAKE_ARGS=" \
                -D BUILD_EXAMPLES=OFF \
                -D BUILD_opencv_python3=ON \
                -D CMAKE_BUILD_TYPE=RELEASE \
                -D CUDA_ARCH_BIN=5.3,6.2,7.2 \
                -D CUDA_ARCH_PTX= \
                -D CUDA_FAST_MATH=ON \
                -D CUDNN_VERSION='8.0' \
                -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
                -D ENABLE_NEON=ON \
                -D OPENCV_DNN_CUDA=ON \
                -D OPENCV_ENABLE_NONFREE=ON \
                -D OPENCV_GENERATE_PKGCONFIG=ON \
                -D WITH_CUBLAS=ON \
                -D WITH_CUDA=ON \
                -D WITH_CUDNN=ON \
                -D WITH_GSTREAMER=ON \
                -D WITH_LIBV4L=ON \
                -D WITH_OPENGL=ON \
                -D CMAKE_VERBOSE_MAKEFILE=ON" \
        pip3 wheel ./opencv-python

# ===============
# INSTALL COZMARS
# ===============
RUN apt install -y ffmpeg
RUN pip3 install rcute-cozmars

ENV LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1