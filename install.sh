#!/bin/bash -e

sudo apt -y update
sudo apt -y install python3-pip
sudo pip install ansible==2.8.7

ansible-playbook --connection=local -i "localhost," ansible/prepare-server.yml
ansible-playbook --connection=local -i "localhost," ansible/install-traccar.yml

if [[ $TC_LETSENCRYPT == true ]]; then
  ansible-playbook --connection=local -i "localhost," ansible/install-letsencrypt.yml
fi
