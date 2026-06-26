#!/usr/bin/env bash
set -oue pipefail

echo "Installing custom applications..."

# Install opencode CLI via npm
if command -v npm &> /dev/null; then
  echo "Installing opencode..."
  npm install -g opencode 2>/dev/null || echo "opencode npm install skipped (will be available at runtime via npm)"
fi

# Install PearPass - download latest RPM from GitHub releases
echo "Installing PearPass..."
PEARPASS_RPM_URL="https://github.com/PearPass/PearPass/releases/latest/download/pearpass-linux-x86_64.rpm"
if curl -fsSL -o /tmp/pearpass.rpm "$PEARPASS_RPM_URL" 2>/dev/null; then
  rpm-ostree install /tmp/pearpass.rpm 2>/dev/null || dnf install -y /tmp/pearpass.rpm 2>/dev/null || echo "PearPass RPM install deferred"
else
  echo "PearPass RPM not found, will install at runtime"
fi

# Install pi.dev CLI
echo "Installing pi.dev..."
curl -sSL https://pi.dev/install.sh 2>/dev/null | bash 2>/dev/null || echo "pi.dev install deferred to runtime"

echo "Custom installations complete"
