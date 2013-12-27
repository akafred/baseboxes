#!/bin/sh
cd desktop
vagrant destroy
vagrant up --provision
# Attempt to make resizing and other stuff work by reinstalling Guestadditon:
# using prerelease because of https://github.com/mitchellh/vagrant/issues/2251
#vagrant plugin install --plugin-source https://rubygems.org --plugin-prerelease vagrant-vbguest
#vagrant vbguest --do rebuild
#vagrant vbguest --do start
# -- Commented out because probable reason is that the VBClient-services are not running
# properly: http://www.virtualbox.org/manual/ch12.html#idp58970320
# Guest desktop services in guests running the X11 window system (Solaris, Linux and ...)
# are provided by a guest service called VBoxClient, which runs under the ID of the user
# who started the desktop session and is automatically started using the following command
# lines
# VBoxClient --clipboard
# VBoxClient --display
# VBoxClient --seamless
# when your X11 user session is started if you are using a common desktop environment
# (Gnome, KDE and others). If a particular desktop service is not working correctly, it
# is worth checking whether the process which should provide it is running.
# The VBoxClient processes create files in the user's home directory with names of the
# form .vboxclient-*.pid when they are running in order to prevent a given service from
# being started twice. It can happen due to misconfiguration that these files are created
# owned by root and not deleted when the services are stopped, which will prevent them
# from being started in future sessions. If the services cannot be started, you may wish
# to check whether these files still exist.
#
# Problem was actually solved by logging in (gui) with the veewee-user... and logging out.

vagrant halt
vagrant package --include packagefile  --vagrantfile Vagrantsettings
vagrant box add "CentOS-6.4-x86_64-epel-ansible-desktop-v$(date +"%Y%m%d")" package.box
mv -f packagefile "packagefile.$(date +"%Y%m%d")"
mv -f package.box "package.$(date +"%Y%m%d").box"
cd ..
