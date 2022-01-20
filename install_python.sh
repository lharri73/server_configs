#!/bin/bash
set -ex

# install python build requirements
sudo apt-get update
sudo apt-get install -y \
    make \
    cmake \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    vim \
    tmux \
    git

curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"    # if `pyenv` is not already on PATH' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

pyenv install 3.9.9
pyenv global 3.9.9
pyenv exec pip install --upgrade pip 

# ray start --head --port 6379 --dashboard-port 8265 --gcs-server-port 3141 --node-manager-port 3142 --object-manager-port 3143
