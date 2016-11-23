#!/bin/bash
# Author: Prithvi Kambhampati
echo "disable monitor" >> /etc/ntp.conf
/etc/init.d/ntpd restart
