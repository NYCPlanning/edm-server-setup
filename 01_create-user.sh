# RUN as root for the following: 
# 1. CREATE NEW USER
useradd -m -p $PASSWORD -s /bin/bash $USERNAME

# 2. CREATE LINKED FODLER
mkdir /home/$USERNAME/project

mkdir /home/coder/project
mkdir /home/jovyan/work
mount --bind /home/$USERNAME/project /home/coder/project
mount --bind /home/$USERNAME/project /home/jovyan/work

# 3. Change ownership
chown -R $USERNAME /home/$USERNAME