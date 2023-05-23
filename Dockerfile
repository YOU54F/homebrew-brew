FROM ubuntu:22.04

ENV PATH="/root/.rbenv/shims:/root/.rbenv/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

RUN apt-get update && \
      apt-get install -y --force-yes \
      build-essential curl git zlib1g-dev libssl-dev \
      libreadline-dev libyaml-dev libxml2-dev libxslt-dev && \
      apt-get clean

      # Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv && \
    git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
      # /root/.rbenv/plugins/ruby-build/install.sh
RUN rbenv install 2.6.10 && \
    rbenv global 2.6.10 && \
      ruby --version && curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
      # # Install packages for building homebrew
    #   apt-get install --yes build-essential procps curl file git
      # # Install homebrew for aarch64 linux
RUN /bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/YOU54F/3238dae00aeda9e8fa870b9644abc3f8/raw/ffec1d4f44b45b7305bb9a4c157e65c3c1792695/install.sh)" || true
RUN brew --version

      