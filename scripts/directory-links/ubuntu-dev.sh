#!/bin/bash

rm ~/.subversion
ln -s /mnt/hgfs/etc/subversion ~/.subversion

rm ~/.hgrc
ln -s /mnt/hgfs/etc/mecurial/hgrc ~/.hgrc

rm ~/.gitconfig
rm ~/.gitignore
rm ~/.gitk
ln -s /mnt/hgfs/etc/git/gitconfig ~/.gitconfig
ln -s /mnt/hgfs/etc/git/gitignore ~/.gitignore
ln -s /mnt/hgfs/etc/git/gitk ~/.gitk
