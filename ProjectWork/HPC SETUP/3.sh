#!/bin/bash
# Author: Prithvi Kambhampati
#1
cd /export/rocks/install/contrib/6.1/x86_64/RPMS/
#2
yumdownloader --enablerepo=updates,base --destdir=/export/rocks/install/contrib/6.1/x86_64/RPMS/ bash
#3
cd /export/rocks/install
#4
rocks create distro
#5
rocks run host frontend "yum clean all; yum -y update bash"
