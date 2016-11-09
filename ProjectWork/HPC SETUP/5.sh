#!/bin/bash
#BASH script to make sure that email notifications from the Grid Engine queing system are sent to un5390@mtu.edu, the following steps need to be followed in the front end.
#Author: slanka@mtu.edu
#1
echo "myhostname = un5390.reseach.mtu.edu">>/etc/postfix/main.cf
#/etc/postfix/main.cf
echo "relayhost = relay.mtu.edu">>/etc/postfix/main.cf
#2
/etc/init.d/postfix restart
#END