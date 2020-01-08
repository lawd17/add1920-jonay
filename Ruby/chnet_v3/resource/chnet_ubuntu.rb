#!/usr/bin/env ruby

require 'rainbow'

def get_network_information
  data = {}
  items = `ip a | grep 'inet ' | grep -v 'host lo'`.split
  data[:ip] = items[1]
  data[:if_name] = items.last

  items = `ip route | grep default`.split
  data[:gateway] = items[2]

  ok = system('ping -c1 8.8.4.4 > /dev/null')
  data[:internet] = (ok ? 'Ok' : Rainbow('No access').red)
  return data
end

def display_network_information
  data = get_network_information
  puts "[INFO] Showing network configuration"
  puts "  OS       : #{Rainbow(data[:os]).bright}"
  puts "  IF name  : #{Rainbow(data[:if_name]).bright}"
  puts "  IP/mask  : #{Rainbow(data[:ip]).bright}"
  puts "  Gateway  : #{Rainbow(data[:gateway]).bright}"
  puts "  Internet : #{Rainbow(data[:internet]).bright}"
end

def reset
  data = get_network_information
  name = 'Reset'
  puts "[INFO] #{Rainbow(name).bright} configuration..."
  `sudo ifdown #{data[:if_name]}`
  `sudo ifup #{data[:if_name]}`
end

def set_classroom109
  data = get_network_information
  name = 'classroom109'
  puts "[INFO] Setting '#{Rainbow(name).bright}' configuration..."
  `sudo ip addr add 172.19.12.0/16 dev #{data[:if_name]}`
  `sudo ip addr del #{data[:ip]} dev #{data[:if_name]}`

end

def set_myhome
  data = get_network_information
  name = 'myhome'
  puts "[INFO] Setting '#{Rainbow(name).bright}' configuration..."
  `sudo ip addr add 192.168.1.17/24 dev #{data[:if_name]}`
  `sudo ip addr del #{data[:ip]} dev #{data[:if_name]}`
end

def change_network_configuration
  puts "==================================="
  puts "chnet: CHange NETwork configuration"
  puts "==================================="
  puts " r. Reset"
  puts " 1. Classroom 109"
  puts " 2. My home"
  puts " 3. Get network information"
  print "\n Select option [Enter=exit]: "
  option = gets.chop
  if option == 'r'
    reset
  elsif option == '1'
    set_classroom109
  elsif option == '2'
    set_myhome
  elsif option == '3'
    display_network_information
  end
end

change_network_configuration
