#!/bin/bash

# ------------------------------------------------------------
# Discord Updater Script (Cross-Distro Bash Version)
# Downloads and installs the latest Discord package automatically
# ------------------------------------------------------------

set -e

DISCORD_URL_DEB="https://discord.com/api/download?platform=linux&format=deb"
DISCORD_URL_TAR="https://discord.com/api/download?platform=linux&format=tar.gz"
DISCORD_URL_RPM="https://discord.com/api/download?platform=linux&format=rpm"
TEMP_DIR="/tmp/discord_update"
mkdir -p "$TEMP_DIR"

echo "🔄 Updating Discord..."

# Detect package manager
if command -v apt-get &>/dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
elif command -v yum &>/dev/null; then
    PKG_MANAGER="yum"
elif command -v zypper &>/dev/null; then
    PKG_MANAGER="zypper"
elif command -v pacman &>/dev/null; then
    PKG_MANAGER="pacman"
else
    PKG_MANAGER="unknown"
fi

# Download & install based on distro
case "$PKG_MANAGER" in
    apt)
        echo "📦 Debian/Ubuntu detected..."
        curl -L "$DISCORD_URL_DEB" -o "$TEMP_DIR/discord.deb"
        sudo dpkg -i "$TEMP_DIR/discord.deb" || sudo apt-get install -f -y
        ;;
    dnf|yum)
        echo "📦 Fedora/RHEL detected..."
        curl -L "$DISCORD_URL_RPM" -o "$TEMP_DIR/discord.rpm"
        sudo "$PKG_MANAGER" install -y "$TEMP_DIR/discord.rpm"
        ;;
    zypper)
        echo "📦 openSUSE detected..."
        curl -L "$DISCORD_URL_RPM" -o "$TEMP_DIR/discord.rpm"
        sudo zypper --non-interactive install "$TEMP_DIR/discord.rpm"
        ;;
    pacman)
        echo "📦 Arch-based distro detected..."
        curl -L "$DISCORD_URL_TAR" -o "$TEMP_DIR/discord.tar.gz"
        tar -xzf "$TEMP_DIR/discord.tar.gz" -C "$TEMP_DIR"
        sudo rm -rf /opt/Discord
        sudo mv "$TEMP_DIR/Discord" /opt/
        sudo ln -sf /opt/Discord/Discord /usr/bin/discord
        ;;
    *)
        echo "❌ Unsupported distro. Please install manually from:"
        echo "   https://discord.com/download"
        exit 1
        ;;
esac

# Cleanup
rm -rf "$TEMP_DIR"

echo "✅ Discord has been updated successfully!"
