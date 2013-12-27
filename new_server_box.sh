#!/bin/sh
cd server
vagrant destroy
vagrant up --provision
vagrant halt
vagrant package --include packagefile
vagrant box add "CentOS-6.4-x86_64-epel-ansible-v$(date +"%Y%m%d")" package.box
mv packagefile "packagefile.$(date +"%Y%m%d")"
mv package.box "package.$(date +"%Y%m%d").box"
cd ..