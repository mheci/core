# core &nbsp; [![bluebuild build badge](https://github.com/mheci/core/actions/workflows/build.yml/badge.svg)](https://github.com/mheci/core/actions/workflows/build.yml)

Custom Bazzite-based OS image for development, AI workloads, and gaming.

Built with [BlueBuild](https://blue-build.org/).

## Features

- **Base**: [Bazzite-Nvidia-Open](https://bazzite.gg/) with open-source NVK driver support for NVIDIA GPUs
- **Development**: VS Code, Zed Editor, Kitty terminal, opencode CLI
- **AI**: LM Studio for running AI models locally
- **Gaming**: Heroic Games Launcher, Lutris, UMU Launcher
- **Browsing**: Zen Browser, Brave Browser
- **Productivity**: LocalSend, PearPass, pcmanfm-qt file manager, KIO integration
- **Performance**: NVIDIA shader cache (100GiB), QML disk cache, LAVD scheduler in performance mode
- **SCX Schedulers**: LAVD configured for maximum performance
- **Fonts**: Nerd Fonts (FiraCode, JetBrainsMono, Hack, Meslo, CascadiaCode), Google Fonts (Inter, Noto Sans Arabic, Ubuntu)
- **Spell Checking**: English (US) and Arabic language packs

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

```bash
# First rebase to the unsigned image, to get the proper signing keys and policies installed
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mheci/core:latest

# Reboot to complete the rebase
systemctl reboot

# Then rebase to the signed image
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/mheci/core:latest

# Reboot again to complete the installation
systemctl reboot
```

The `latest` tag will automatically point to the latest build.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running:

```bash
cosign verify --key cosign.pub ghcr.io/mheci/core
```

## Custom Just Commands

After installation, run `ujust` to see available commands:

- `ujust update-all` - Update system and flatpaks
- `ujust cleanup` - Prune old deployments and unused flatpaks
- `ujust nvidia-info` - Display NVIDIA driver information
- `ujust shader-cache-status` - Check NVIDIA shader cache settings
- `ujust scx-status` - Check SCX scheduler status
