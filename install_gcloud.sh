#!/bin/bash

# Set a central location for Google Cloud SDK installation
INSTALL_DIR="$HOME/tools"

# Create the directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Navigate to the central directory
cd "$INSTALL_DIR"

# Download Google Cloud CLI into the central directory
curl -o "$INSTALL_DIR/google-cloud-cli-linux-x86_64.tar.gz" https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz

# Extract the tarball in the central directory
tar -xf "$INSTALL_DIR/google-cloud-cli-linux-x86_64.tar.gz" -C "$INSTALL_DIR"

# Navigate to the extracted directory
cd "$INSTALL_DIR/google-cloud-sdk"

# Run the install script with minimal setup options
./install.sh --quiet --path-update true --command-completion true

# Clean up the tarball after extraction
rm "$INSTALL_DIR/google-cloud-cli-linux-x86_64.tar.gz"
