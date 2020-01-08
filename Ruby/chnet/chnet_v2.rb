#!/usr/bin/env ruby

require 'rainbow'

def reset
  puts "#{Rainbow('Change').bright} configuration..."
  `sudo ifup eth0`
  `sudo ifdown eth0`
end

def change_network_configuration
  puts "==================================="
  puts "chnet: CHange NETwork configuration"
  puts "==================================="
  puts " r. Reset"
  puts " 0. DHCP"
  puts " 1. Classroom 109"
  puts " 2. My home"
  print "\n Select option [Enter=exit]: "
  option = gets.chop
  if option == 'r'
    reset
  elsif option == '0'
    `sudo cp confnet/eth0-dinamic /etc/sysconfig/network/ifcfg-eth0`
    reset
  elsif option == '1'
    `sudo cp confnet/eth0-static-aula109 /etc/sysconfig/network/ifcfg-eth0`
    reset
  elsif option == '2'
    `sudo cp confnet/eth0-static-myhome /etc/sysconfig/network/ifcfg-eth0`
    reset
  end
end
change_network_configuration
