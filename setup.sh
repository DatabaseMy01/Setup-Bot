#!/bin/bash

set -e

echo "🛠️ Memulai setup environment..."

# Update sistem & install tools penting
echo "🔧 Mengupdate sistem & menginstal paket-paket..."
sudo apt update -y
sudo apt install -y build-essential wget curl git unzip zip neofetch make g++ imagemagick webp ffmpeg python3-pip speedtest-cli pkg-config libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev librsvg2-dev

# Install NVM (Node Version Manager)
echo "📦 Menginstal NVM..."
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

# Load NVM ke shell
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Instal Node.js versi 24
NODE_VERSION="24"
echo "⬇️ Menginstal Node.js versi $NODE_VERSION..."
nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION

# Install modul global
echo "📦 Menginstal module global: pm2, node-gyp..."
npm install -g pm2 node-gyp

# Tambahkan modul ffmpeg ke PM2 (opsional)
# pm2 install ffmpeg

# Tampilkan info sistem
echo "🖥️ Menampilkan info sistem..."
neofetch

echo "✅ Setup selesai! Node.js versi $NODE_VERSION sudah siap digunakan."
