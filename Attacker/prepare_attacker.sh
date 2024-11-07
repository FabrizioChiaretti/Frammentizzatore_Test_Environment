ip -4 addr flush dev eth1
ip -6 addr add 2001:DB8:0:1::3/64 dev eth1
ip -6 route add default via 2001:DB8:0:1::1
