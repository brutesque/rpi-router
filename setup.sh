#!/usr/bin/env bash

sudo apt update
sudo apt install --yes git

sudo rm -Rf /tmp/rpi-cellular-router
sudo git clone https://github.com/brutesque/rpi-cellular-router /tmp/rpi-cellular-router
