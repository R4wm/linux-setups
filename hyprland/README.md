# Lean Arch Linux + Hyprland Desktop

Minimal, clean Arch Linux desktop with Hyprland (Wayland compositor). No bloat.

## What's included

**Desktop:**
- Hyprland + Waybar + Mako + Wofi/Rofi
- Alacritty terminal, Dolphin file manager
- cliphist + wl-clipboard (clipboard history via SUPER+X)
- PipeWire audio stack
- SDDM display manager

**Development:**
- Git, gh CLI, base-devel (gcc, make)
- CMake, Clang, Go, GDB
- Python 3 + virtualenv
- NVM with Node 18, 20, 22
- Docker + docker-compose
- Emacs, VS Code (AUR)
- Ansible

**GPU:** AMD Radeon (mesa + vulkan-radeon + VAAPI)

**Media:** ffmpeg, VLC, Audacity, HandBrake

**Browsers:** Firefox, Chromium (native packages, no snap)

**Communication:** Slack, Teams (Flatpak)

**Users:** Creates additional `r4wm` user with sudo (wheel group)

## Keybindings (vim-style)

- **SUPER + i/j/k/l** - Focus up/left/down/right
- **SUPER + SHIFT + i/j/k/l** - Move window
- **SUPER + O** - Move window to next monitor
- **SUPER + Return** - Terminal
- **SUPER + R** - App launcher
- **SUPER + X** - Clipboard history
- **SUPER + E** - File manager
- **SUPER + SHIFT + C** - Close window
- **SUPER + F** - Fullscreen
- **SUPER + 1-9** - Switch workspace

See [HOTKEYS.md](files/hypr/HOTKEYS.md) for full reference.

## Quick start

    cd hyprland/

    # Test connectivity
    ansible arch_desktops -i inventory.ini -m ping

    # Dry run
    ansible-playbook playbook.yml -i inventory.ini --check --diff

    # Deploy
    ansible-playbook playbook.yml -i inventory.ini -K -v

## Post-install

1. Configure monitors:

       hyprctl monitors
       # Create ~/.config/hypr/monitors.conf
       # Uncomment source line in hyprland.conf

2. Sign into browsers, restore SSH/GPG keys, configure AWS CLI

## Customization

- Shared settings: [group_vars/all.yml](group_vars/all.yml)
- Desktop overrides: [group_vars/arch_desktops.yml](group_vars/arch_desktops.yml)
- Laptop overrides: [group_vars/arch_laptops.yml](group_vars/arch_laptops.yml)
- Config files: [files/](files/)
