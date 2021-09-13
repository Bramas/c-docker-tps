FROM ubuntu:20.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  gcc \
  make \
  git \
  wget \
  curl \
  libsdl2-dev \
  libsdl2-ttf-dev \
  valgrind \
  strace \
  manpages \
  manpages-posix \
  manpages-dev \
  manpages-posix-dev \
&& rm -rf /var/lib/apt/lists/*


RUN curl https://gitlab.com/bramas/libtps.h/raw/master/install.sh | bash -
ENV LD_LIBRARY_PATH /usr/local/lib
