# sysadmin scripts
This repository contains various tools and scripts for system administration tasks.

## `auto_repo_commit.sh`
This script automates the process of committing and pushing changes to a Git repository. It allows the user to specify:
- The repository path (`-p`)
- The commit message (`-m`)
- The branch (`-b`)
- The remote (`-r`)

If no options are provided, it uses default values:
- Path: current working directory
- Commit message: "Automatic commit" with the current date and time
- Branch: `main`
- Remote: `origin`

The script checks if **Git** is installed, verifies the repository, adds all changes, commits with the provided message, and pushes the changes to the specified remote and branch.


## `docker_init.sh`
This script installs the necessary prerequisites, **Docker**, and **Portainer** on a Debian-based system. It sets up Docker, runs the `hello-world` container for verification, and deploys Portainer for Docker management.


## `scan_network.sh`
This script performs a network scan using **Nmap**

