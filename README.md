# Frammentizzatore_Test_Environment
Repository whose purpose is to mantain the virtual environment used for performing experiments with the Frammentizzatore tool.

## Set up instructions

The environment is a simple virtual network that is provided by Vagrant tool. The network consists in two subnetworks: the *Intnet* network (2001:db8::/64), that is the victim host's network and the *Extnet* network (2001:db8:0:1::/64), that is the attacker's network. A firewall-router machine is connected to both the subnetworks and it interconnects them, but it's firewall is configured to block the traffic from the attacker network to the victim network. The attacker can leverage on the attacker tool in order to bypass the firewall and to communicate with the victim host.\
Each machine can be switched on by "vagrant up --provision *machine_name*". The names of the machines are specified in the following.

The attacker machine is an Ubuntu 20.04  (**attacker-host**) and the Frammentizzatore tool is installed at the startup. Its IPv6 address is 2001:db8:0:1::5 and its default gateway is the firewall-router machine (2001:db8:0:1::1). Once the machine is on, it is required to install manually the attacker tool dependancies:
  - sudo apt-get update,
  - sudo apt install python3-pip,
  - sudo apt install libnetfilter-queue-dev,
  - sudo pip install NetfilterQueue,
  - sudo apt install python3-scapy.

The Frammentizzatore tool will be located in the vagrant folder and can be run by "sudo -E python3 runner.py" command after the depedencies have been installed.

The firewall machines are Debian 11  (**debian11-fw-machine**), Debian 12 (**debian12-fw-machine**), Freebsd 13.2-release (**freebsd-fw-machine**), OpenBSD 6.9 (**openbsd-fw-machine**), NetBSD 9.3 (**netbsd-fw-machine**) machines. The IPv6 address of the *Intnet* interface is 2001:db8::5 and the IPv6 address of the *Extnet* inteface is 2001:db8:0:1::1.
On Debian 12 machine it is required to install iptables module manually: 
  - sudo apt-get update,
  - sudo apt install iptables.
After the iptables module is installed it is required to reboot the machine.
It is possible to switch on just one firewall-router machine at a time, therefore the user has to choose a firewall-router machine at a time for performing experiments.

The victim machines are Ubuntu 23.04 (**ubuntu23.04-machine**), Archlinux (**archlinux-machine**) and Windows 10 (**windows10-machine**) machines. The victim's IPv6 address is 2001:db8::3 and its default gateway is the firewall machine (2001:db8::5).

All the desidered tools must be installed manually on the machines.
