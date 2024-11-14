
sysctl -w net.inet.ip.forwarding=1
sysctl -w net.inet6.ip6.forwarding=1

ifconfig vioif1 inet6 2001:db8::5/64
ifconfig vioif2 inet6 2001:db8:0:1::1/64

cp /tmp/pf.conf /etc/pf.conf
sudo /etc/rc.d/pf onestart
pfctl -f /etc/pf.conf
sudo /etc/rc.d/pf onestop
sudo /etc/rc.d/pf onestart

