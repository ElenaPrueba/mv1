#!/bin/sh
# echo 'Configurando acceso ssh'
# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# service sshd restart

echo '--->Instalando paqueteria de sistema...'
sudo yum update -y &&
sudo yum install -y epel-release &&
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm &&
sudo yum install -y python36u python36u-pip python36u-devel postgresql-server postgresql-devel posgresql-contrib nginx &&
sudo yum install -y policycoreutils-python
sudo yum install -y gcc

echo '--->Instalando paqueteria python...'
sudo pip3.6 install virtualenv

echo '--->Adecuando permisos de usuarios...'
sudo usermod -a -G vagrant nginx
chmod 710 /home/vagrant

# echo 'Ajuste de sistema operativa para correcto funcionamiento nginx.'
# sudo setsebool -P httpd_can_network_connect 1
# #https://stackoverflow.com/questions/23948527/13-permission-denied-while-connecting-to-upstreamnginx
