# Ubuntu 24.04 GNOME Desktop - Snapshot

Point-in-time capture of the desktop configuration as of 2026-03-11.
Use this to restore the exact Ubuntu+GNOME setup if needed.

## Hardware

- CPU: AMD Ryzen 9 7900X 12-Core
- GPU: AMD Radeon RX 7900 XT/XTX (Navi 31) + Raphael iGPU
- RAM: 94GB
- Storage: 954GB Inland SATA SSD + 1.8TB WD Blue SA510
- Optical: BD-RE BP60NB10

## Stack

- Ubuntu 24.04.2 LTS (Noble Numbat)
- Kernel 6.14.0-33-generic
- GNOME Shell 46.0 on X11
- GDM3 display manager
- AwesomeWM 4.3 (alternate WM)
- PipeWire audio
- Docker 27.1.1
- NVM with Node 18, 20, 22

## Quick start

    # Syntax check
    ansible-playbook -i inventory.ini playbook.yml --check --diff

    # Run
    ansible-playbook -i inventory.ini playbook.yml -K
