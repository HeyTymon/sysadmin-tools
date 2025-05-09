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

## iaac_tools_init.sh
This script installs and configures essential Infrastructure as Code (**IaC**) tools on a Debian-based system. It must be run with root privileges.

It installs:
- **Docker** along with its dependencies and official APT repository
- **Portainer** for web-based Docker container management
- **Terraform** from the official HashiCorp repository

Additionally:
- Runs a `hello-world` test container to verify Docker installation
- Creates a volume for Portainer and starts it in a container
- Verifies the availability of the `terraform` command after installation

## scan_network.sh  
This script performs a detailed network scan using **Nmap**. It requires **Nmap** to be installed on the system.

The script:
- Verifies that **Nmap** is installed
- Creates a `nmap_results/` directory (if it doesn't exist)
- Performs a scan on the target IP or hostname passed as the first argument
- Saves the output to `nmap_results/output.txt`

The scan includes:
- TCP SYN scan (`-sS`)
- UDP scan (`-sU`)
- Version detection (`-sV`)
- OS detection (`-O`)
- Specific ports: `U:53,111,137` and `T:21,22,23,24,25,80,139,8080`


## `generate_password.sh`
This script generates random passwords with customizable lengths and character sets. It allows the user to specify:
- The length of the password (`$1`)
- The type of characters to include (`$2`)

If no arguments are provided:
- The default password length is set to 10 characters, and the password will contain only uppercase and lowercase letters.

The second argument (`$2`) determines the type of characters:
- `1`: Includes letters and digits 
- `2`: Includes letters and special characters 
- `3`: Includes letters, digits, and special characters 

