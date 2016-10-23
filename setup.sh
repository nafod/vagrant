#!/bin/bash

# Get rid of annoying stdin messages
export DEBIAN_FRONTEND=noninteractive

MYHOME=/home/vagrant

# General setup stuff
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# Install some basic packages
sudo apt-get -y install vim htop tmux git strace zip gcc binutils unzip gdb gdb-multiarch python-pip python3-pip gcc-multilib

# Install package dependencies now
sudo apt-get -y install python2.7 python-pip python-dev git libssl-dev
sudo apt-get -y install python-lzma python-crypto python3-crypto
sudo apt-get -y install default-jre
sudo apt-get -y install libffi-dev build-essential virtualenvwrapper

# Grab my config from GitHub
cd $MYHOME
git clone https://github.com/cmalekpour/configs.git
ln -s $MYHOME/configs/vimrc $MYHOME/.vimrc
ln -s $MYHOME/configs/radarerc $MYHOME/.radarerc

# Set up home directory
cd $MYHOME
mkdir tools

# Install PEDA
cd $MYHOME/tools
git clone https://github.com/longld/peda.git
echo "source ${MYHOME}/tools/peda/peda.py" >> $MYHOME/.gdbinit

# Install pwntools
cd $MYHOME/tools
pip install --upgrade pwntools

# Install radare2
cd $MYHOME/tools
git clone https://github.com/radare/radare2.git
sudo $MYHOME/tools/radare2/sys/install.sh

# Install binwalk
cd $MYHOME/tools
sudo pip install capstone
sudo pip3 install capstone
git clone https://github.com/devttys0/binwalk.git
sudo python $MYHOME/tools/binwalk/setup.py install

# Install apktool
cd $MYHOME/tools
mkdir apktool
cd apktool
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.2.1.jar
mv *.jar apktool.jar
chmod +x apktool.jar
chmod +x apktool
mv apktool /usr/local/bin/apktool
mv apktool.jar /usr/local/bin/apktool.jar

# Install angr
cd $MYHOME/tools
sudo pip install angr

# Install sqlmap
cd $MYHOME/tools
git clone https://github.com/sqlmapproject/sqlmap.git
