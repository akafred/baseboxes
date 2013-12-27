#!/bin/sh
sudo yum -y update
sudo rpm -Uhv http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install ansible
# rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n" | grep -v 'gpg-pubkey' | sort | tr "\\n" " " | awk '{print "yum -y install " $0 }' > /vagrant/packagefile
rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n" | grep -v 'gpg-pubkey' | sort > /vagrant/packagefile
