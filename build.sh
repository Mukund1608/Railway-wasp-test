#!/bin/bash

# Install Wasp
curl -sSL https://get.wasp-lang.dev/installer.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Verify Wasp installation
wasp version

# Start the application
wasp start
