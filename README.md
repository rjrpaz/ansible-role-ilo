ilo
=========

A simple role to manage ilo from Linux (Redhat) servers.

This role is a work in progress. For now it just install/upgrade the ILO firmware using OS packet management tools.

Requirements
------------

This role assumes you already downloaded desired firmware version rpm package to the *files/* directory.

Latest version for the firmware can be found [here](https://support.hpe.com/connect/s/softwaredetails?language=es&softwareId=MTX_84b8360ec9734362bab837f82b&tab=revisionHistory).

Check *revision history* link and select latest version. Then select the download link and you will find the rpm file.

Role Variables
--------------

- installer_directory: directory where the rpm package is going to be copied (default value: /var/tmp)
- firmware_package: name of the rpm file to be copied. It should be located in *files/* (default value: firmware-ilo4-2.80-1.1.i386.rpm)
- ilo: dictionary that defines ILO version according to HP server model. Current values are:
  - Gen9: ilo4
  - Gen10: ilo5

Dependencies
------------

This role doesn't require any additional non-core roles.

Example Playbook
----------------

Check *tests/firmware_upgrade.yml* as an example of how to use this role. You can run the role like this (please remember to set [roles path](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#default-roles-path) properly to make this role reachable by the playbook):

```bash
$ ansible-playbook -u user -kK --extra-vars="server=destVm" -i inventory_file firmware_upgrade.yml
 ...
```

- *user*: user to log on the remote server using SSH. The user should be able to escalate superuser privileges.

- *destVm*: server where this agent is going to be installed. It should exist in the *inventory_file* below. Name of a group of servers or the reserved word "all" can be used (check ansible documentation for more info).

- *inventory_file*: inventory file including the list of servers where this playbook might be applied.

License
-------

BSD

Author Information
------------------

[https://github.com/rjrpaz/ansible-ilo](https://github.com/rjrpaz/ansible-ilo)
