#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y build-essential wget curl git unzip zip neofetch make g++ imagemagick webp ffmpeg python3-pip speedtest-cli pkg-config libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev librsvg2-dev

export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

NODE_VERSION="22"
nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION

npm install -g node-gyp

neofetch
