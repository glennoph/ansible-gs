# ansible-getting-started-notes
notes for getting started with ansible
See https://www.udemy.com/ansible-quick-start 

## Environment setup
Vagrant was used to provision the servers
* control: running centos7 used to execute ansible scripts
* centos client running centos7
* ubuntu client running ubuntu

See Vagrantfile for details.

### Install ansible on control

access the control system with:
`vagrant ssh control`

install packages needed for ansible on centos

```bash
sudo yum install epel-release
sudo yum update
sudo yum install git python python-devel python-pip openssl ansible

```

* check that ansible is installed
```shell
ansible --version
ansible 2.4.2.0
```
### Post install Setup of control 
* edit /etc/ansible/ansible.cfg
uncomment following lines:
```
inventory      = /etc/ansible/hosts
sudo_user      = root
```
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




