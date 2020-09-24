FROM ubuntu:20.04

# volume & workdir
WORKDIR /gccsh2
VOLUME /home/usr

# path env...
ENV INSTALLDIR      /toolchain
ENV WD /gccsh2

# packet needed
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    autotools-dev \
    automake \
    build-essential \
    bison \
    cmake \
    curl \
    flex \
    git \
    texinfo \
    tree \
    parallel \
    python3-pip \
    pv \
    wget \
    genisoimage \
    zlib1g-dev \
    libtinfo5 \
    p7zip-full 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# only for canadian toolchain
# RUN apt-get install gcc-mingw-w64 g++-mingw-w64 -y

# paths
RUN mkdir -p /toolchain && mkdir -p ${WD}/src && mkdir -p ${WD}/build/binutils && mkdir -p ${WD}/build/gcc

COPY build-bleeding-edge-toolchain.sh build-bleeding-edge-toolchain.sh
RUN chmod a+x ./build-bleeding-edge-toolchain.sh && ./build-bleeding-edge-toolchain.sh && cp -r ${WD}/installNative/* /toolchain && rm -rf ${WD}

ENV PATH=/toolchain/bin:${PATH}

#ENTRYPOINT [bash]
