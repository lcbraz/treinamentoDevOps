#!/usr/bin/env bash

echo
echo -- Installing dependencies and utilities
echo
apt-get update
apt-get install -y chrony tmux vim net-tools tcpdump curl links iperf \
	git gnupg crun podman

echo
echo -- Fixing locales
echo
sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo
echo -- Config timezone to America/Sao_Paulo
echo
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## authorized_keys
useradd -m -s /bin/bash leandro
mkdir /home/leandro/.ssh
cat > /home/leandro/.ssh/authorized_keys <<-EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkCo4iXOb3dGpfqoizJH+m9CPNEvAXLVNozd+DUC/cQ lcbraz@gmail.com
EOF

cat > /etc/sudoers.d/leandro <<-EOF
leandro ALL=(ALL) NOPASSWD:ALL
EOF

