FROM ubuntu:24.04

# Install ansible, ansible-lint, python-pip, sshpass
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update \
    && apt-get -y install \
    ansible \
    ansible-lint \
    python3-pip \
    sshpass \
    && DEBIAN_FRONTEND=noninteractive apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --break-system-packages --no-cache-dir --upgrade pyvmomi
    # Mount SSH keys at runtime

# Mount configuration directory for ansible
COPY ansible.cfg /workdir/ansible.cfg
COPY .ansible-lint /workdir/.ansible-lint
