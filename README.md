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

### Using the ilo role

```yaml
- hosts: servers
  collections:
    - rjrpaz.server_management
  roles:
    - ilo
```

Or with the fully qualified collection name:

```yaml
- hosts: servers
  roles:
    - rjrpaz.server_management.ilo
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

## License

MIT

## Author Information

Roberto Paz - [https://github.com/rjrpaz/ansible-role-ilo](https://github.com/rjrpaz/ansible-role-ilo)
