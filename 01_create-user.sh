#!/bin/sh
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
# RUN as root for the following: 
# 1. CREATE NEW USER
useradd -m -s /bin/bash $USERNAME
echo "$PASSWORD" | passwd --stdin $USERNAME

# 2. CREATE LINKED FODLER
mkdir -p /home/$USERNAME/project

mkdir -p /home/coder/project
mkdir -p /home/jovyan/work
mount --bind /home/$USERNAME/project /home/coder/project
mount --bind /home/$USERNAME/project /home/jovyan/work

# 3. Change ownership and to sudo and docker group
chown -R $USERNAME /home/$USERNAME
usermod -aG docker $USERNAME
usermod -aG sudo $USERNAME

# 4. generate ssh-key
mkdir -p /home/$USERNAME/.ssh/id_rsa
ssh-keygen -t rsa -f /home/$USERNAME/.ssh/id_rsa -N ''
chown -R $USERNAME /home/$USERNAME/.ssh
