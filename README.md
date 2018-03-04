# ansible-getting-started-notes
notes for getting started with ansible
See https://www.udemy.com/ansible-quick-start 

## Environment setup
Vagrant was used to provision the servers
* control: running ubuntu used to execute ansible scripts
* club# client running ubuntu

See Vagrantfile for details.

### Install ansible on control
via shell: boot-control.sh

access the control system with:
`vagrant ssh control`

install packages needed for ansible on centos

```bash
apt-get -q update
apt-get -y install software-properties-common # python
apt-add-repository -y ppa:ansible/ansible
apt-get -q update
apt-get -y install ansible
apt-get -y autoremove
```

* check that ansible is installed
```shell
ansible --version
ansible 2.4.2.0
```
#### update hosts
```
# vagrant env nodes
10.0.17.10 control
10.0.17.21 club1
10.0.17.22 club2

```
NB need to update rest

* edit /etc/ansible/hosts
see [hosts](hosts)

* add user ansible
`sudo adduser ansible`

* set password for ansible user, hint: secr2018
`sudo passwd ansible`
allow sudo without password:
`sudo visudo`
below root add line:
`ansible ALL=(ALL)       NOPASSWD: ALL`

* add user ansible to *centos* server
`sudo adduser ansible`
`sudo passwd ansible`
`sudo visudo`

* add user ansible to *ubuntu* server
`sudo adduser ansible`
`sudo visudo`
add line
`ansible ALL=(ALL) NOPASSWD: ALL`
su ansible
`sudo su ansible -`
apt-get update
`sudo apt-get update`
(if the update cmd runs without prompting for password, then setup is good)

* ssh key exchange so do not have to enter passwords for ansible commands
(on control)
```
sudo su ansible -
ssh-keygen # dft location, no passphrase
```
* copy ssh id to ansible@centos 
`ssh-copy-id ansible@centos`
are you sure? yes
enter pw for ansible.
ssh to centos:
`ssh ansible@centos`
(if logged in to ansible@centos, then good)

* copy ssh id to ansible@ubuntu 
`ssh-copy-id ansible@ubuntu`
are you sure? yes
enter pw for ansible.
ssh to ubuntu:
`ssh ansible@ubuntu`
(if logged in to ansible@ubuntu, then good)




