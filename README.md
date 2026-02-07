# Ansible Collection - rjrpaz.server_management

A collection for server management tasks including ILO firmware management.

## Included content

### Roles

- **ilo**: Role to manage ILO devices on HPE servers

## Installing this collection

You can install the rjrpaz.server_management collection with the Ansible Galaxy CLI:

```bash
ansible-galaxy collection install rjrpaz.server_management
```

## Using this collection

### Basic Usage

Use the fully qualified collection name (FQCN) as recommended:

```yaml
---
- name: Update ILO firmware on servers
  hosts: servers
  become: true
  tasks:
    - name: Include ILO role
      ansible.builtin.include_role:
        name: rjrpaz.server_management.ilo
      vars:
        ilo_firmware_package: "firmware-ilo5-2.82-1.1.x86_64.rpm"
```

### Example Playbook

```yaml
---
- name: HPE Server ILO Firmware Management
  hosts: hpe_servers
  become: true
  vars:
    ilo_installer_directory: /tmp
    ilo_firmware_package: "firmware-ilo5-2.82-1.1.x86_64.rpm"

  tasks:
    - name: Update ILO firmware
      ansible.builtin.include_role:
        name: rjrpaz.server_management.ilo
```

## Requirements

- Ansible 2.15 or later
- HPE ILO firmware RPM packages in the `roles/ilo/files/` directory

## Role Variables

Available variables are listed below, along with default values (see `roles/ilo/defaults/main.yml`):

```yaml
# Directory where the rpm package will be copied
ilo_installer_directory: /var/tmp

# Name of the rpm file to be copied (should be in roles/ilo/files/)
ilo_firmware_package: firmware-ilo4-2.80-1.1.i386.rpm

# ILO version mapping by HP server generation
ilo_versions:
  Gen9: ilo4
  Gen10: ilo5
```

## Supported Platforms

This collection is tested and supported on:

- **Operating Systems**: RHEL/CentOS/Rocky Linux 6+
- **HPE Server Generations**: Gen9, Gen10, Gen10 Plus
- **ILO Versions**: ILO4, ILO5

## Prerequisites

### Firmware Files

1. Download the appropriate ILO firmware RPM from [HPE Support](https://support.hpe.com/connect/s/softwaredetails?language=en&softwareId=MTX_84b8360ec9734362bab837f82b)
2. Place the RPM file in `roles/ilo/files/` directory
3. Update the `ilo_firmware_package` variable with the correct filename

### Inventory Requirements

Ensure your target hosts meet these requirements:

- Running RHEL/CentOS/Rocky Linux 6 or later
- SSH access with sudo privileges
- `dmidecode` utility available (usually pre-installed)

## Development and Testing

### Local Development with Docker

This project includes Docker-based tooling for consistent development environments.

#### Prerequisites to locally develop the collection

- Docker installed and running
- Make utility

#### Available Commands

```bash
# Lint the collection using ansible-lint
make lint

# Build the Docker image for development
make build-image

# Run arbitrary ansible commands in the container
make ansible -- --version

# Clean up generated files
make clean
```

#### Docker Development Environment

The included `Dockerfile` provides a containerized environment with:

- Ubuntu 24.04 base
- Ansible and ansible-lint pre-installed
- Python 3 and pip
- All necessary development tools

To use the development environment:

```bash
# Build the development image
make build-image

# Run linting
make lint

# Interactive development session
docker run --rm -it -v $(PWD):/workdir/ilo -w /workdir ansible-toolbox bash
```

### Testing

#### Local Collection Testing

```bash
# Build the collection
ansible-galaxy collection build

# Install locally for testing
ansible-galaxy collection install rjrpaz-server_management-*.tar.gz --force

# Run the test playbook
ansible-playbook tests/test.yml
```

#### Continuous Integration

The project includes GitHub Actions workflows that:

- Run `ansible-lint` on all branches
- Test against multiple Ansible versions (4.x, 5.x, 6.x)
- Build and validate the collection
- Publish to Galaxy (main branch only)

### Linting

#### Using Docker (Recommended)

```bash
make lint
```

#### Using Local ansible-lint

```bash
# Install ansible-lint
pip install ansible-lint

# Run linting
ansible-lint
```

### Building and Publishing

#### Manual Build

```bash
# Build collection artifact
ansible-galaxy collection build

# Install for testing
ansible-galaxy collection install rjrpaz-server_management-*.tar.gz

# Manual publish (requires Galaxy API key)
ansible-galaxy collection publish rjrpaz-server_management-*.tar.gz --api-key YOUR_API_KEY
```

#### Automated Publishing

The collection is automatically published to Ansible Galaxy when:ç

1. Code is pushed to the `main` branch
2. All tests and linting pass
3. `GALAXY_API_KEY` secret is configured in GitHub repository settings

## Troubleshooting

### Common Issues

#### Permission Denied

Ensure the user has sudo privileges:

```bash
ansible-playbook -b -K your-playbook.yml
```

#### Firmware File Not Found

Verify the firmware file exists and the variable is correct:

```bash
ls -la roles/ilo/files/
```

#### Unsupported Server Generation

Check if your server generation is mapped in `ilo_versions`:

```bash
sudo dmidecode | grep "Product Name:"
```

### Debug Mode

Enable Ansible debug output:

```bash
ansible-playbook -vvv your-playbook.yml
```

## Migration from Standalone Role

If upgrading from the previous standalone role, update your playbooks:

### Before (v0.x - standalone role)

```yaml
- hosts: servers
  roles:
    - ilo
  vars:
    installer_directory: /var/tmp
    firmware_package: firmware.rpm
```

### After (v1.x - collection)

```yaml
- hosts: servers
  tasks:
    - include_role:
        name: rjrpaz.server_management.ilo
      vars:
        ilo_installer_directory: /var/tmp
        ilo_firmware_package: firmware.rpm
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `make lint`
5. Submit a pull request

### Development Workflow

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/ansible-role-ilo.git
cd ansible-role-ilo

# Create feature branch
git checkout -b feature/my-improvement

# Make changes and test
make lint
ansible-playbook tests/test.yml --syntax-check

# Commit and push
git commit -m "Add: my improvement"
git push origin feature/my-improvement
```

## License

MIT

## Author Information

Roberto Paz - [https://github.com/rjrpaz/ansible-role-ilo](https://github.com/rjrpaz/ansible-role-ilo)
