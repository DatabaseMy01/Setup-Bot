#!/bin/bash

set -e

echo "🛠️ Memulai setup environment..."

# Update sistem & install tools penting
echo "🔧 Mengupdate sistem & menginstal paket-paket..."
sudo apt update -y
sudo apt install -y wget curl git unzip zip neofetch make g++ imagemagick webp ffmpeg python3-pip speedtest-cli

# Install NVM
echo "📦 Menginstal NVM (Node Version Manager)..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Load NVM ke shell
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Instal Node.js v24.4.1
NODE_VERSION="v24.4.1"
echo "⬇️ Menginstal Node.js versi $NODE_VERSION..."
nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION

# Install modul global
echo "📦 Menginstal module global: pm2, node-gyp..."
npm install -g pm2 node-gyp

# Tambahkan modul ffmpeg ke PM2
pm2 install ffmpeg

# Info sistem
echo "🖥️ Menampilkan info sistem..."
neofetch

echo "✅ Setup selesai! Node.js versi $NODE_VERSION sudah siap digunakan."
