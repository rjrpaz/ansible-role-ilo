# Ansible Role: ilo

This role manages ILO firmware on HPE servers running RHEL/CentOS/Rocky Linux.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
# Directory where the rpm package will be copied
ilo_installer_directory: /var/tmp

# Name of the rpm file to be copied (should be in files/)
ilo_firmware_package: firmware-ilo4-2.80-1.1.i386.rpm

# ILO version mapping by HP server generation
ilo_versions:
  Gen9: ilo4
  Gen10: ilo5
```

## Requirements

- Ansible 2.15 or later
- RHEL/CentOS/Rocky Linux 6 or later
- HPE ILO firmware RPM packages placed in `files/` directory
- sudo privileges on target hosts

## Dependencies

None.

## Example Playbook

```yaml
---
- name: Update ILO firmware
  hosts: hpe_servers
  become: true
  roles:
    - role: rjrpaz.server_management.ilo
      vars:
        ilo_firmware_package: "firmware-ilo5-2.82-1.1.x86_64.rpm"
```

## License

MIT

## Author Information

Roberto Paz - [https://github.com/rjrpaz/ansible-role-ilo](https://github.com/rjrpaz/ansible-role-ilo)