#!/bin/bash
# Download key
sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/debian/$(lsb_release -rs)/amd64/latest/salt-archive-keyring.gpg
# Create apt sources list file
echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/debian/$(lsb_release -rs)/amd64/latest $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/salt.list

apt update
apt install salt-minion -y


echo "" > /etc/salt/minion
echo "master: ${SALTSTACK_MASTER}" >> /etc/salt/minion
echo "id: ${SALTSTACK_MINIONID}" >> /etc/salt/minion

service salt-minion restart
