# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  
  config.vm.define "attacker-host" do |v|
    v.vm.box = "generic/ubuntu2004"
    v.vm.hostname = "attacker-host"
    
    v.vm.network :private_network, ip: "192.168.124.2",
      libvirt__network_name: "extnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8:0:1::5",
      libvirt__ipv6_prefix: "64"
    
    v.vm.provision "shell", path:"prepare_attacker.sh"
    #v.vm.provision "file", source: "Attacker_tool", destination: "."
    
  end
  
  
  config.vm.define "debian11-fw-machine" do |v|
    v.vm.hostname = "debian11-fw-machine"
    v.vm.box = "debian/bullseye64"
    v.vm.network :private_network, ip: "192.168.122.1",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::5",
      libvirt__ipv6_prefix: "64"
      
    v.vm.network :private_network, ip: "192.168.124.1",
      libvirt__network_name: "extnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8:0:1::1",
      libvirt__ipv6_prefix: "64"
    
    v.vm.provision "shell", path:"prepare_fw_debian11.sh"
    
  end
  
  
  config.vm.define "ubuntu23.04-machine" do |v|
    v.vm.hostname = "ubuntu23.04-machine"
    v.vm.box = "generic/ubuntu2304"
    v.vm.network :private_network, ip: "192.168.122.2",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::3",
      libvirt__ipv6_prefix: "64"
    
    v.vm.provision "shell", path:"prepare_victim_ubuntu2304.sh"
    
  end
  
  
  config.vm.define "debian12-fw-machine" do |v|
    v.vm.box = "generic/debian12"
    v.vm.hostname = "debian12-fw-machine"
    v.vm.network :private_network, ip: "192.168.122.1",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::5",
      libvirt__ipv6_prefix: "64"
      
    v.vm.network :private_network, ip: "192.168.124.1",
      libvirt__network_name: "extnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8:0:1::1",
      libvirt__ipv6_prefix: "64"
    
    v.vm.provision "shell", path:"prepare_fw_debian12.sh"
    
  end
  
  
  config.vm.define "archlinux-machine" do |v|
    v.vm.box = "archlinux/archlinux"
    v.vm.hostname = "archlinux-machine"
    
    v.vm.network :private_network, ip: "192.168.122.2",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::3",
      libvirt__ipv6_prefix: "64"
    
    v.vm.provision "shell", path: "./prepare_victim_archlinux.sh"
  
  end
  
  
  config.vm.define "windows10-machine" do |v|
    v.vm.box = "peru/windows-10-enterprise-x64-eval"
    v.vm.hostname = "windows10-machine"
    
     v.vm.network :private_network, ip: "192.168.122.2",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::3",
      libvirt__ipv6_prefix: "64"
      
    v.vm.provision "shell", path: "prepare_victim_windows10.ps1"
   
  end
  
  
  config.vm.define "freebsd-fw-machine" do |v|
    v.vm.box = "generic/freebsd13"
    v.vm.hostname = "freebsd-fw-machine"
    
    v.vm.network :private_network, ip: "192.168.122.1",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::5",
      libvirt__ipv6_prefix: "64"
      
    v.vm.network :private_network, ip: "192.168.124.1",
      libvirt__network_name: "extnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8:0:1::1",
      libvirt__ipv6_prefix: "64"
      
    v.vm.provision "file", source: "pf_freebsd.conf", destination: "/usr/home/vagrant/pf.conf"
    v.vm.provision "shell", path:"prepare_fw_freebsd.sh"
    
  end
  
  
   config.vm.define "netbsd-fw-machine" do |v|
      v.vm.hostname = "netbsd-fw-machine"
      v.vm.box = "generic/netbsd9"
      v.vm.box_version = "4.3.2"
      
      v.vm.network :private_network, ip: "192.168.122.1",
      libvirt__network_name: "intnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8::5",
      libvirt__ipv6_prefix: "64"
      
      v.vm.network :private_network, ip: "192.168.124.1",
      libvirt__network_name: "extnet",
      libvirt__forward_mode: "veryisolated",
      libvirt__dhcp_enabled: false,
      libvirt__guest_ipv6: "yes",
      libvirt__ipv6_address: "2001:DB8:0:1::1",
      libvirt__ipv6_prefix: "64"

      v.vm.provision "file", source: "pf_netbsd.conf", destination: "/tmp/pf.conf"
      v.vm.provision "shell", path:"prepare_fw_netbsd.sh"
      
   end
 
 
    config.vm.define "openbsd-fw-machine" do |v|
      v.vm.box = "generic/openbsd6"
      v.vm.hostname = "openbsd-fw-machine"
  
      v.vm.network :private_network, ip: "192.168.122.1",
        libvirt__network_name: "intnet",
        libvirt__forward_mode: "veryisolated",
        libvirt__dhcp_enabled: false,
        libvirt__guest_ipv6: "yes",
        libvirt__ipv6_address: "2001:DB8::5",
        libvirt__ipv6_prefix: "64"
      
      v.vm.network :private_network, ip: "192.168.124.1",
        libvirt__network_name: "extnet",
        libvirt__forward_mode: "veryisolated",
        libvirt__dhcp_enabled: false,
        libvirt__guest_ipv6: "yes",
        libvirt__ipv6_address: "2001:DB8:0:1::1",
        libvirt__ipv6_prefix: "64"
      
      v.vm.provision "file", source: "hostname.vio2",     destination: "/tmp/hostname.vio2"
      v.vm.provision "file", source: "hostname.vio1",     destination: "/tmp/hostname.vio1"
      v.vm.provision "file", source: "pf_openbsd.conf",   destination: "/tmp/pf.conf"
      v.vm.provision "shell", path:"prepare_fw_openbsd.sh"
  
   end
  
  
end











