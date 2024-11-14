netsh interface ipv6 add address "Ethernet 2" 2001:DB8::3/64
netsh interface ipv6 add route ::/0 "Ethernet 2" 2001:DB8::5
netsh advfirewall firewall add rule name="ICMP Allow incoming V6 echo request" protocol="icmpv6:128,any" dir=in action=allow
netsh firewall add portopening UDP 5002 "NetBIOS UDP Port 5002"
netsh firewall add portopening TCP 5001 "NetBIOS TCP Port 5001"
