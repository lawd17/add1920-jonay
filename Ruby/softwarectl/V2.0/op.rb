#!/usr/bin/ruby
require_relative 'r'
require_relative 'st'
def option(file)
  if ARGV[0] == "--help"
    help
  elsif ARGV[0] == "--version"
    version
  elsif ARGV[0] == "--status"
    status(file)
  elsif ARGV[0] == "--run"
    run(file)
  else
    puts "softwarectl: opción inválida --'#{ARGV[0]}'"
    puts "Pruebe 'softwarectl --help' para más información."
  end
end

def help
  puts'
  Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove'
end

def version
  puts "
  softwarectl 1.0
  2019 Developed by Jonay Hernández Izquierdo.
  This is free software: you are free to change and redistribute it.
  There is NO WARRANTY, to the extent permitted by law.
  "
end
