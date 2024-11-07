New-NetIPAddress -IPAddress 2001:DB8::3 -PrefixLength 64 -InterfaceAlias "Ethernet 2" -DefaultGateway 2001:db8::4
netsh advfirewall firewall add rule name="ICMP Allow incoming V6 echo request" protocol="icmpv6:128,any" dir=in action=allow
netsh firewall add portopening UDP 5002 "NetBIOS UDP Port 5002"
netsh firewall add portopening TCP 5001 "NetBIOS TCP Port 5001"
