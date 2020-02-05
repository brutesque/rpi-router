# Raspberry Pi Router

These instructions will help create a router from a raspberry pi. The goal is to setup eth0 as LAN and eth1 as WAN.
This particular setup works with a raspberry pi B2 and a Huawei E3372 LTE USB stick. 

Write 2019-09-26-raspbian-buster-lite.img to a SD-card. Insert the SD-card into the raspberry pi and start it up.
Log into the Raspberry Pi and make sure that you can connect to the internet using the LTE USB stick:
```bash
ping 1.1.1.1
```

Enter the following command to setup the router:
```bash
bash -c "$(curl -fsSL raw.githubusercontent.com/brutesque/rpi-router/master/install.sh)"
```



Resources:
- https://www.g7smy.co.uk/2014/08/raspberry-pi-as-a-3g4g-router/
- https://www.fastnetserv.com/how-to-make-a-raspberry-pi-3-as-a-3g4g-router/
