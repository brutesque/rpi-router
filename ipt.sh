#!/bin/bash
LAN="eth0"
WAN="eth1"

# flush tables
iptables -F
iptables -t nat -F

# apply routing
iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE
iptables -A FORWARD -i $WAN -o $LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT
