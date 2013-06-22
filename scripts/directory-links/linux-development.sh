#!/bin/bash

# Make sure Shared Folders is enabled and the following mapping is made:
#   up  --> C:\Users\julian

rm ~/.ssh
ln -s /mnt/hgfs/up/.ssh ~/.ssh

rm ~/.inputrc
ln -s /mnt/hgfs/up/.inputrc ~/.inputrc

rm ~/.bashrc
ln -s /mnt/hgfs/up/.bashrc ~/.bashrc

rm ~/.bash_logout
ln -s /mnt/hgfs/up/.bash_logout ~/.bash_logout

rm ~/.subversion
ln -s /mnt/hgfs/up/.subversion ~/.subversion

rm ~/.hgrc
ln -s /mnt/hgfs/up/.hgrc ~/.hgrc

rm ~/.gitconfig
rm ~/.gitignore
rm ~/.gitk
ln -s /mnt/hgfs/up/.gitconfig ~/.gitconfig
ln -s /mnt/hgfs/up/.gitignore ~/.gitignore

ln -s /mnt/hgfs/up/Dropbox ~/Dropbox
ln -s /mnt/hgfs/up/SkyDrive ~/SkyDrive
ln -s /mnt/hgfs/up/BTSync ~/BTSync

rm -Rf ~/Documents
ln -s /mnt/hgfs/up/Documents ~/Documents

rm -Rf ~/Downloads
ln -s /mnt/hgfs/up/Downloads ~/Downloads

rm -Rf ~/Pictures
ln -s /mnt/hgfs/up/Pictures ~/Pictures
