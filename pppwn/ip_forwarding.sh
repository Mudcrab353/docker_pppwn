#!/bin/sh

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Set up NAT (MASQUERADE) to forward traffic from eth1 to eth0
iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
iptables -A FORWARD -i enx74dadaf4bd40 -o eno1 -j ACCEPT
iptables -A FORWARD -i eno1 -o enx74dadaf4bd40 -m state --state RELATED,ESTABLISHED -j ACCEPT
