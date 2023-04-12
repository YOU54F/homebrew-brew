FROM ubuntu:22.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y git curl sudo ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://gist.githubusercontent.com/ryansch/ab306af869743643286a55c67c6866ab/raw/24d965a1e6be01a168c1dd62233502b519c4c6c7/install.sh | /bin/bash
RUN ls /opt/homebrew && brew --version
RUN brew --version

