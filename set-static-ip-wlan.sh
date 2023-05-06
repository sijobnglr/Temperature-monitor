#!/bin/bash

# This script must be run by "sudo" and must
# have IPADDRESS, GATEWAY, and NETMASK all
# defined on "sudo's" command line, like this:
# sudo IPADDRESS="192.168.1.x" GATEWAY="192.168.1.x" NETMASK="255.255.255.0" /pathtoscript/

# turn off networking
ifdown wlan0

echo Type IP
read IPADDRESS
echo Type Subnet Mask
read SUBNETMASK
echo Type Gateway
read GATEWAY
echo Type DNS
read DNSSERVER
echo Type Broadcast Address
read BROADCASTADDR

# modify the /etc/network/interfaces file
cat >/etc/network/interfaces <<-__END__
auto lo

iface lo inet loopback

auto eth0
iface wlan0 inet static
    address $IPADDRESS
    gateway $GATEWAY
    netmask $SUBNETMASK
    network $DNSSERVER
    broadcast $BROADCASTADDR

allow-hotplug wlan0
iface wlan0 inet manual
iface default inet dhcp
__END__

# start networking back up again.
ifup wlan0
