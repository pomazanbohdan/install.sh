#!/bin/bash
adduser centos & \
passwd centos & \
usermod -aG wheel centos & \
passwd -d centos & \
echo 'centos ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers & \
mkdir /home/centos/.ssh & \
cp /root/.ssh/authorized_keys /home/centos/.ssh/authorized_keys & \
chown -R centos:centos /home/centos/.ssh & \
echo 'Port 22222' >> /etc/ssh/sshd_config & \
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config & \
yum update -y
yum install git mc htop wget zsh chrony screen -y
systemctl enable chronyd & systemctl start chronyd & shutdown -r now 