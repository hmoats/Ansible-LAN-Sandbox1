#!/bin/bash

cat <<EOF
conf t
  interface g0/0
    no switchport
    ip address $1 255.255.255.0
    no shut
    exit
  hostname example
  ip domain-name example.com
  crypto key generate rsa modulus 1024
  username cisco privilege 15 secret cisco
  line vty 0 4
    transport input ssh
    login local
  end
wr mem
EOF
