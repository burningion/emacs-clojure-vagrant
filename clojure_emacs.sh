#!/bin/bash

shopt -s dotglob

# Thanks to @bretthoerner for the ubuntu mirror of emacs 24
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs-snapshot emacs-snapshot-el git-core rlwrap openjdk-6-jdk tmux \
    curl tree unzip

# dotfiles
mkdir -p ~/bin/
for i in /vagrant/dotfiles/*; do
  cp -r $i /home/vagrant/
done;
emacs --batch -l /home/vagrant/.emacs.d/init.el -f package-updates

chown -R vagrant /home/vagrant
