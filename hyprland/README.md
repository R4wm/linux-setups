# Hyprland Setup with Ansible

Automated setup for Hyprland window manager on Arch Linux systems.

## Overview

This directory contains Ansible automation to deploy a complete Hyprland desktop environment with:
- **Hyprland** - Wayland compositor
- **Waybar** - Status bar
- **Mako** - Notification daemon
- **Wofi** - Application launcher
- **Rofi** - Clipboard history menu
- **Alacritty** - Terminal emulator
- **Various utilities** - brightnessctl, playerctl, clipboard management, etc.
- **Intel graphics stack** - Mesa/Vulkan/VAAPI packages for Intel iGPU
- **Gaming runtime** - gamemode + mangohud
- **Display manager** - SDDM enabled at boot
- **PlayStation emulators** - RetroArch baseline + Flatpak PCSX2/RPCS3/DuckStation

## Quick Start

### Prerequisites

- Ansible installed on your control machine (laptop)
- SSH access to target machine
- Target machine running Arch Linux

### Deploy to Desktop

```bash
cd /home/r4wm/github/linux-setups/hyprland

# Test connectivity
ansible arch_desktops -i inventory.ini -m ping

# Run in check mode first (dry run)
ansible-playbook playbook.yml -i inventory.ini --check --diff

# Deploy for real
ansible-playbook playbook.yml -i inventory.ini -v
```

## Post-Installation

### Configure Monitors

The playbook does **not** deploy monitors.conf as it's hardware-specific. You must configure this manually:

1. SSH into your desktop
2. Detect your monitors:
   ```bash
   hyprctl monitors
   ```

3. Create monitor configuration:
   ```bash
   nano ~/.config/hypr/monitors.conf
   ```

4. Add your monitor setup. Example:
   ```
   # Primary monitor
   monitor=HDMI-A-1,1920x1080@60.0,0x0,1.0

   # Secondary monitor (if any)
   monitor=DP-1,1920x1080@60.0,1920x0,1.0
   ```

5. Uncomment the source line in hyprland.conf:
   ```bash
   nano ~/.config/hypr/hyprland.conf
   # Find and uncomment:
   source = ~/.config/hypr/monitors.conf
   ```

### Launch Hyprland

From a TTY or display manager, start Hyprland:
```bash
Hyprland
```

## Keybindings

See [HOTKEYS.md](files/hypr/HOTKEYS.md) for complete keybinding reference.

### Essential Shortcuts

- **SUPER + Return** - Terminal (alacritty)
- **SUPER + R** - App launcher (wofi)
- **SUPER + X** - Clipboard history (rofi)
- **SUPER + E** - File manager (dolphin)
- **SUPER + SHIFT + C** - Close window
- **SUPER + M** - Exit Hyprland
- **SUPER + F** - Fullscreen
- **SUPER + 1-9** - Switch workspace

## Files Deployed

```
~/.config/hypr/
├── hyprland.conf    # Main configuration
├── workspaces.conf  # Workspace setup
└── HOTKEYS.md       # Keybinding reference

~/.config/waybar/
├── config.jsonc     # Waybar modules
└── style.css        # Waybar styling

~/.config/mako/
└── config           # Notification daemon
```

## Packages Installed

**Core:**
- hyprland
- xdg-desktop-portal-hyprland

**UI Components:**
- waybar
- mako
- wofi
- rofi

**Utilities:**
- alacritty
- dolphin
- cliphist
- wl-clipboard
- brightnessctl
- playerctl
- wireplumber
- pavucontrol
- networkmanager
- flatpak

**Fonts:**
- otf-font-awesome
- ttf-fira-code
- ttf-nerd-fonts-symbols-mono

**Intel graphics + gaming runtime:**
- mesa
- vulkan-intel
- intel-media-driver
- gamemode
- mangohud

**Emulators:**
- retroarch
- retroarch-assets-xmb
- Flatpak: net.pcsx2.PCSX2
- Flatpak: net.rpcs3.RPCS3
- Flatpak: org.duckstation.DuckStation

Note: `pcsx2`, `rpcs3`, and `duckstation` availability can vary by date/repo
and are often installed via AUR/Flatpak rather than official Arch repos.

## Customization

### Add More Machines

Edit [inventory.ini](inventory.ini) to add more target hosts:

```ini
[arch_desktops]
desktop1 ansible_host=10.0.0.217 ansible_user=r4wm

[arch_laptops]
laptop1 ansible_host=10.0.0.218 ansible_user=r4wm
```

### Modify Package Lists / Profiles

- Shared settings: [group_vars/all.yml](group_vars/all.yml)
- Desktop overrides: [group_vars/arch_desktops.yml](group_vars/arch_desktops.yml)
- Laptop overrides: [group_vars/arch_laptops.yml](group_vars/arch_laptops.yml)

### Customize Configs

Configuration files are in the `files/` directory. Edit them and re-run the playbook to deploy changes.

## Troubleshooting

### Playbook Fails with "Permission Denied"

Ensure your SSH key is in the target machine's `~/.ssh/authorized_keys`.

### Packages Not Found

Update pacman cache:
```bash
ansible arch_desktops -i inventory.ini -m community.general.pacman -a "update_cache=yes" --become
```

### Hyprland Won't Start

Check monitor configuration - this is the most common issue. Make sure monitors.conf exists and has valid monitor definitions.

### Waybar Not Showing

Check waybar logs:
```bash
journalctl --user -u waybar -f
```

## Repository Structure

```
hyprland/
├── README.md         # This file
├── inventory.ini     # Ansible inventory
├── group_vars/       # Common + profile-specific variables
│   ├── all.yml
│   ├── arch_desktops.yml
│   └── arch_laptops.yml
├── playbook.yml      # Main Ansible playbook
└── files/            # Configuration files
    ├── hypr/
    ├── waybar/
    └── mako/
```

## Additional Resources

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Documentation](https://github.com/Alexays/Waybar/wiki)
- [Arch Wiki: Hyprland](https://wiki.archlinux.org/title/Hyprland)
