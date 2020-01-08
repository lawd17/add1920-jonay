#!/usr/bin/env ruby
require_relative 'resource/chnet_ubuntu'
require_relative 'resource/chnet_windows'
require os

if OS.linux?
  chnet_opensuse
elsif OS.windows?
  chnet_windows
end
