
sysctl net.ipv6.conf.all.disable_ipv6=0
sysctl net.ipv6.conf.default.disable_ipv6=0
sysctl net.ipv6.conf.all.forwarding=1
sysctl net.ipv6.conf.default.forwarding=1

ip -4 addr flush dev eth1
ip -4 addr flush dev eth2
ip -6 addr flush dev eth1
ip -6 addr flush dev eth2

ip link set dev eth1 up
ip link set dev eth2 up

ip -6 addr add 2001:DB8:0:1::1/64 dev eth2
ip -6 addr add 2001:DB8::5/64 dev eth1

ip6tables -A FORWARD -p udp -s 2001:db8:0:1::5 -j REJECT
ip6tables -A FORWARD -p tcp -s 2001:db8:0:1::5 -j REJECT
ip6tables -A FORWARD -p icmpv6 --icmpv6-type echo-request -j REJECT
