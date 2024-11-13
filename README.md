# Frammentizzatore_Test_Environment
Repository whose purpose is to mantain the virtual environment used for testing Frammentizzatore tool.

## Set up instructions

The environment is a simple virtual network that is provided by Vagrant tool. The network consists in two subnetworks: the *Intnet* network, that is the victim host network and the *Extnet* network, that is the attacker network. The firewall machine is connected to both the subnetworks and it interconnects them, but it is configured to block the traffic from the attacker network to the victim network, therefore the attacker can leverage on the attacker tool in order to bypass the firewall rules and then to communicate with the victim host.

The machine running the attacker tool is an Ubuntu 20.04 machine (named attacker-host) that belongs to the *Extnet* network and its IPv6 address is 2001:db8:0:1::5. Its default gateway is the firewall machine (2001:db8:0:1::1). 
In the attacker machine it is required to install manually the tool's dependancies:
  - sudo apt-get update
  - sudo apt install python3-pip
  - sudo apt install libnetfilter-queue-dev
  - sudo pip install NetfilterQueue
  - sudo apt install python3-scapy

The firewall machines are Debian 11 and Debian 12 machines (named debian11-fw-machine and debian12-fw-machine) that are configured by the script file that is run at the statup. On Debian 12 machine it is required to install iptables module manually: 
  - sudo apt-get update
  - sudo apt install iptables

The victim machine is an Ubuntu 23.04 machine that belongs to the *Intnet* network. Its IPv6 address is 2001:db8::3 and its default gateway is the firewall machine (2001:db8::5).

All the desidered tools must be installed manually on the machines.
