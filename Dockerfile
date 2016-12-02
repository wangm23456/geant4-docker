FROM ubuntu:16.04
MAINTAINER wangm23456 <wangm23456@163.com>
#RUN rm /etc/apt/sources.list \
#    && echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list \
#    && echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse" > /etc/apt/sources.list \
#    && echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" > /etc/apt/sources.list \
#    && echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y \
    #dependency
    make cmake gcc g++ curl wget \
    libxmu-dev libxmuu-dev git dpkg-dev  binutils  \
    libx11-dev libxpm-dev libxft-dev libxext-dev gfortran \
    libssl-dev libpcre3-dev  xlibmesa-glu-dev libglew1.5-dev \
    libftgl-dev  libmysqlclient-dev libfftw3-dev graphviz-dev \
    libavahi-compat-libdnssd-dev  libldap2-dev python-dev \
    libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev
    #download
RUN mkdir ~/Geant4 \
    && mkdir ~/Geant4/{build,install} \
    && cd ~/Geant4 \
    && curl http://geant4.web.cern.ch/geant4/support/source/geant4.10.01.p03.tar.gz \
    && tar -xzf geant4.10.01.p03.tar.gz
    && cd ~/Geant4/build \
    && cmake -DCMAKE_INSTALL_PREFIX=~/Geant4/install \
        -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACE_X11=ON \
        -DGEANT4_BUILD_MULTITHREADED=ON \
        -DGEANT4_INSTALL_DATA=ON ~/Geant4/geant4.10.01.p03 \
    && make -j30 \
    && make install \
    && echo "source ~/Geant4/install/share/Geant4-10.1.3/geant4make/geant4make.sh" \
    > ~/.bashrc


