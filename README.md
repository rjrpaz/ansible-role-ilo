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

- Ansible 2.9 or later
- HPE ILO firmware RPM packages in the `files/` directory

## License

MIT

## Author Information

Roberto Paz - [https://github.com/rjrpaz/ansible-role-ilo](https://github.com/rjrpaz/ansible-role-ilo)
