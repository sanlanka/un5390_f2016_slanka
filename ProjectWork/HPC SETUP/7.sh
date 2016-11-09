#!/bin/bash
#BASH script to Integrate the ISO login system
#
/usr/sbin/authconfig --enablekrb5 --krb5realm MTU.EDU \
	--krb5kdc kerberos.mtu.edu,kerberos1.mtu.edu \
		--krb5adminserver kerberosmaster.mtu.edu \
			--enablelocauthorize --update