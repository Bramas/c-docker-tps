FROM ubuntu:20.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  locales \
  language-pack-fr \
  gcc \
  make \
  git \
  wget \
  curl \
  python \
  libsdl2-dev \
  libsdl2-ttf-dev \
  valgrind \
  lcov \
  strace \
  man \
  manpages \
  manpages-posix \
  manpages-dev \
  manpages-posix-dev \
  vim \
&& rm -rf /var/lib/apt/lists/*

RUN locale-gen "fr_FR.UTF-8"
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr  
ENV LC_ALL fr_FR.UTF-8 

RUN yes | unminimize

RUN curl https://gitlab.com/bramas/libtps.h/raw/master/install.sh | bash -
ENV LD_LIBRARY_PATH /usr/local/lib
