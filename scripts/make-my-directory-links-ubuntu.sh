#!/bin/bash

rm ~/.ssh
ln -s /mnt/hgfs/C/etc/ssh ~/.ssh

rm ~/.subversion
ln -s /mnt/hgfs/C/etc/subversion ~/.subversion

rm ~/.minttyrc
ln -s /mnt/hgfs/C/etc/cygwin/minttyrc ~/.minttyrc

rm ~/.inputrc
ln -s /mnt/hgfs/C/etc/cygwin/inputrc ~/.inputrc

rm ~/.hgrc
ln -s /mnt/hgfs/C/etc/mecurial/hgrc ~/.hgrc

rm ~/.bash_profile
ln -s /mnt/hgfs/C/etc/cygwin/bash_profile ~/.bash_profile

rm ~/.bashrc
ln -s /mnt/hgfs/C/etc/cygwin/bashrc ~/.bashrc

rm ~/dev
ln -s /mnt/hgfs/C/dev ~/dev

rm ~/.gitconfig
rm ~/.gitignore
rm ~/.gitk
ln -s /mnt/hgfs/C/etc/git/gitconfig ~/.gitconfig
ln -s /mnt/hgfs/C/etc/git/gitignore ~/.gitignore
ln -s /mnt/hgfs/C/etc/git/gitk ~/.gitk
