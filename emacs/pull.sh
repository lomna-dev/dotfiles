#!/bin/sh

#This script will copy the swiper folder from installed config to git repo folder
rm -r $PWD/swiper
cp -r $HOME/.emacs.d/swiper $PWD
