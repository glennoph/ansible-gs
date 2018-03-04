#!/usr/bin/env bash

# install ansible to control/ubuntu

apt-get -q update
apt-get -y install software-properties-common # python
apt-add-repository -y ppa:ansible/ansible
apt-get -q update
apt-get -y install ansible
apt-get -y autoremove

# copy work files tbd
cp -a /vagrant/scripts/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# setup hosts file
cat >> /etc/hosts <<EOF
# vagrant env nodes
10.0.17.10 control
10.0.17.21 club1
10.0.17.22 club2
EOF

