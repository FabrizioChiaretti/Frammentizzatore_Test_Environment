
sysctl -w net.inet.ip.forwarding=1
sysctl -w net.inet6.ip6.forwarding=1

cp /tmp/hostname.vio1 /etc/hostname.vio1
cp /tmp/hostname.vio2 /etc/hostname.vio2
pfctl -d
cp /tmp/pf.conf /etc/pf.conf
sudo pfctl -f /etc/pf.conf
sh /etc/netstart
pfctl -e

