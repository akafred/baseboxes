#!/bin/sh
sudo yum -y update
sudo yum -y groupinstall Desktop
sudo yum -y install dejavu-sans-mono-fonts
#rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n" | grep -v 'gpg-pubkey' | sort | tr "\\n" " " | awk '{print "yum -y install " $0 }' > /vagrant/packagefile
rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n" | grep -v 'gpg-pubkey' | sort > /vagrant/packagefile
sudo sed -i -e 's/id:3:initdefault:/id:5:initdefault:/g' /etc/inittab
