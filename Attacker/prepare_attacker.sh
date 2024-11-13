sysctl net.ipv6.conf.all.disable_ipv6=0
sysctl net.ipv6.conf.default.disable_ipv6=0
ip link set dev eth1 up 
ip -4 addr flush dev eth1
ip -6 addr flush dev eth1
ip -6 addr add 2001:DB8:0:1::5/64 dev eth1
ip -6 route add default via 2001:DB8:0:1::1

# The following commands are required to install the extenal dependancies of the attacker tool:
# sudo apt-get update
# sudo apt install python3-pip
# sudo apt install libnetfilter-queue-dev
# sudo pip install NetfilterQueue
# sudo apt install python3-scapy
