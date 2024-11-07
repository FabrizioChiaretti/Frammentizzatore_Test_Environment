sysctl net.ipv6.conf.all.forwarding=1
sysctl net.ipv6.conf.default.forwarding=1

ip -4 addr flush dev eth1
ip -4 addr flush dev eth2

ip -6 addr add 2001:DB8:0:1::1/64 dev eth2
ip -6 addr add 2001:DB8::4/64 dev eth1

ip6tables -A FORWARD -p udp -s 2001:db8:0:1::3 -j REJECT
ip6tables -A FORWARD -p tcp -s 2001:db8:0:1::3 -j REJECT
ip6tables -A FORWARD -p icmpv6 --icmpv6-type echo-request -j REJECT
