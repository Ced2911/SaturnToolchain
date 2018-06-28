FROM ubuntu:18.04


# volume & workdir
WORKDIR /gccsh2
VOLUME /home/usr

# path env...
ENV INSTALLDIR      /toolchain
ENV WD /gccsh2

# packet needed
RUN apt-get update && apt-get install -y \
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
	p7zip-full

# only for canadian toolchain
RUN apt-get install gcc-mingw-w64 g++-mingw-w64 -y

# paths
RUN mkdir -p ${WD}/src && mkdir -p /toolchain && mkdir -p ${WD}/build/binutils && mkdir -p ${WD}/build/gcc

COPY build-bleeding-edge-toolchain.sh       build-bleeding-edge-toolchain.sh
RUN ./build-bleeding-edge-toolchain.sh 

ENV PATH=/toolchain/bin:${PATH}

#ENTRYPOINT [bash]