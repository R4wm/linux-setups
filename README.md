# linux-setups

Personal Linux setup repository with OS-specific provisioning, configs, and helper scripts.

## Repository map

- `hyprland/`
  - Arch Linux Hyprland automation (Ansible).
  - Start here for the current desktop/laptop Arch setup.
  - Main files:
    - `hyprland/playbook.yml`
    - `hyprland/inventory.ini`
    - `hyprland/group_vars/`
    - `hyprland/files/`
    - `hyprland/README.md`

- `ubuntu/`
  - Ubuntu-oriented setup notes/resources.
  - See `ubuntu/README.md`.

- `kube/`
  - Kubernetes local setup helpers.
  - See `kube/install.sh` and `kube/README.md`.

- `awesome/`
  - AwesomeWM setup script(s).
  - Entry: `awesome/install.sh`.

- `home/`
  - Home shell/bootstrap files and encrypted shell config artifacts.
  - Includes `home/install.sh` and `home/decrypt.sh`.

- `installs/`
  - Misc install helpers (currently includes Ubuntu-focused scripts under `installs/ubuntu/`).

- `scripts/`
  - Small utility scripts (for example `scripts/get_1hr_epoch.sh`).

- `templates/`
  - Reusable templates/scaffolding (for example `templates/python/`).

- `stuff/`
  - Misc personal utilities/secrets material (encrypted/plain assets).
  - See `stuff/README.md` before using.

## Current recommended path (Arch + Hyprland)

1. Go to `hyprland/`
2. Update host(s) in `hyprland/inventory.ini`
3. Review profile defaults in `hyprland/group_vars/`
4. Run:
   - `ansible-playbook -i inventory.ini playbook.yml --syntax-check`
   - `ansible-playbook -i inventory.ini playbook.yml -v`

## Notes

- This repo mixes active automation with legacy/personal setup artifacts.
- Prefer adding new machine automation under a dedicated directory with its own `README.md`.
