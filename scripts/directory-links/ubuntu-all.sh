#!/bin/bash

rm ~/.ssh
ln -s /mnt/hgfs/etc/ssh ~/.ssh

rm ~/.inputrc
ln -s /mnt/hgfs/etc/cygwin/inputrc ~/.inputrc

rm ~/.bashrc
ln -s /mnt/hgfs/etc/cygwin/bashrc ~/.bashrc

rm ~/.bash_logout
ln -s /mnt/hgfs/etc/cygwin/bash_logout ~/.bash_logout
