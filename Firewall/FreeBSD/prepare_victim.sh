
sysrc ifconfig_vtnet1_ipv6="inet6 2001:DB8::4"
sysrc ifconfig_vtnet2_ipv6="inet6 2001:db8:0:1::1"

sysrc gateway_enable=yes
sysrc ipv6_gateway_enable=yes
sysrc ipv6_network_interfaces=auto
sysrc ipv6_activate_all_interfaces=yes

sysctl net.inet.ip.forwarding=1
sysctl net.inet6.ip6.forwarding=1

service netif restart
service routing restart

cp /usr/home/vagrant/pf.conf /etc/
sysrc pf_enable=yes
sysrc pflog_enable=yes
pflog_logfile="/var/log/pflog"
service pf start
pfctl -f /etc/pf.conf
#service pflog start

