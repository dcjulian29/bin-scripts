#!/bin/bash

ln -s /mnt/hgfs/Dropbox ~/Dropbox
ln -s /mnt/hgfs/SkyDrive ~/SkyDrive

rm -Rf ~/Documents
ln -s /mnt/hgfs/Documents ~/Documents

rm -Rf ~/Downloads
ln -s /mnt/hgfs/Downloads ~/Downloads

rm -Rf ~/Pictures
ln -s /mnt/hgfs/Pictures ~/Pictures
