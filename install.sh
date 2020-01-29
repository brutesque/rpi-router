#!/usr/bin/env bash

set -e

sudo apt update
sudo apt install --yes git

sudo rm -Rf /tmp/rpi-cellular-router
sudo git clone https://github.com/brutesque/rpi-cellular-router /tmp/rpi-cellular-router

# https://www.g7smy.co.uk/2014/08/raspberry-pi-as-a-3g4g-router/

# Configuring the network
sudo cp /etc/sysctl.conf /etc/sysctl.conf.old
sudo cp /tmp/rpi-cellular-router/etc/sysctl.conf /etc/sysctl.conf
sudo sysctl -w net.ipv4.ip_forward=1

sudo cp /etc/network/interfaces /etc/network/interfaces.old
sudo cp /tmp/rpi-cellular-router/etc/network/interfaces /etc/network/interfaces

# Setup DHCP
sudo apt install --yes isc-dhcp-server
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.old
sudo cp /tmp/rpi-cellular-router/etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf

# Accessing the internet
sudo apt install --yes iptables
chmod +x /tmp/rpi-cellular-router/ipt.sh
sudo /tmp/rpi-cellular-router/ipt.sh
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo cp /tmp/rpi-cellular-router/etc/network/if-up.d/iptables /etc/network/if-up.d/iptables
sudo chmod +x /etc/network/if-up.d/iptables
