#!/bin/bash
#BASH script for CUSTOMIZATION, SECURITY and COMPLIANCE
#Author: slanka ,slanka@mtu.edu
#1
rocks report host firewall localhost
#2
rocks remove firewall host=localhost rulename=A40-WWWW-PUBLIC-LAN
#3
rocks add firewall host=localhost network=public \
	 protocol=tcp service=wwww chain=INPUT action=ACCEPT flags="-m state --state NEW --source 0.0.0.0/0.0.0.0" rulename=A40--WWW-PUBLIC-NEW
#4
rocks remove firewall host=localhost rulename=A40-HTTPS-PUBLIC-LAN
#5
rocks add firewall host=localhost network=public protocol=tcp \
	service=https chain=INPUT action=ACCEPT flags="-m state --state NEW --source 141.219.0.0/255.255.0.0" rulename=A40-HTTPS-PUBLIC-NEW
#6
rocks add firewall host=localhost network=public protocol-tcp \
	service=ssh chain=INPUT action=ACCEPT flags="-m state --state NEW --source 141.219.0.0/255.255.0.0" rulename=A20-SSH-PUBLIC
#7
rocks sync host firewall localhost
#8
rocks report host firewall localhost
#END

	