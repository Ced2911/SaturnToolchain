FROM ubuntu:18.10

# volume & workdir
# WORKDIR /gccsh2
VOLUME /workspace

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
    nodejs \
    unzip \
    libtool-bin \
    help2man \
    gawk \
    libncurses5-dev \
	p7zip-full

# only for canadian toolchain
#RUN apt-get install gcc-mingw-w64 g++-mingw-w64 -y

# install node js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# clean apt directory
RUN rm -rf /var/lib/apt/lists/*

# paths
RUN mkdir -p /toolchain && mkdir -p ${WD}

# clone crosstool-ng to last stable tag
RUN git clone -b 'crosstool-ng-1.24.0' --single-branch --depth 1 https://github.com/crosstool-ng/crosstool-ng ${WD}/crosstool-ng

# copy build config & build scripts
COPY build-crosstool-ng.sh ${WD}/build-crosstool-ng.sh
COPY saturn.config ${WD}/crosstool-ng/.config

# time to build toolchain
RUN chmod a+x ${WD}/build-crosstool-ng.sh && ${WD}/build-crosstool-ng.sh && rm -rf ${WD}

# remove work directory
# RUN rm -rf ${WD}/*

ENV PATH=/toolchain/bin:${PATH}

#ENTRYPOINT [bash]