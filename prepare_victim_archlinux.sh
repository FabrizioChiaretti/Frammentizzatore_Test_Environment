
sysctl net.ipv6.conf.all.disable_ipv6=0
sysctl net.ipv6.conf.default.disable_ipv6=0

ip link set dev eth1 up 
ip -4 addr flush dev eth1
ip -6 addr flush dev eth1

ip -6 addr add 2001:DB8::3/64 dev eth1
ip -6 route add default via 2001:db8::5

#sudo pacman -S tcpdump
#sudo pacman -S netcat
