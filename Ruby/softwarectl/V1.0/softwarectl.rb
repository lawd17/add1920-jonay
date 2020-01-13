#!/usr/bin/ruby
require 'colorize'
def option(input1,input2)
  if input1 == "--help"
    help()
  elsif input1 == "--version"
    version()
  elsif input1 == "--status"
    if input2 == nil
      puts "Error. Falta parametro".colorize(:red)
      puts "Pruebe 'softwarectl --help' para más información.".colorize(:red)
    else
      status(input2)
    end
  elsif input1 == "--run"
    if input2 == nil
      puts "Error. Falta parametro".colorize(:red)
      puts "Pruebe 'softwarectl --help' para más información.".colorize(:red)
    else
      file = check_file(input2)
      run(file)
    end
  else
    puts "softwarectl: opción inválida --'#{input1}'".colorize(:red)
    puts "Pruebe 'softwarectl --help' para más información.".colorize(:red)
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

def run(file)
  user = `whoami`.strip
  if user == "root"
    file.each do |key,value|
      ok = `whereis #{key} | grep bin | wc -l`.to_i
      if value == "install"
        if ok == 0
          `apt install -y #{key}`
          puts "software #{key} instalado".colorize(:green)
        else
          puts "software #{key} ya está instalado.".colorize(:yellow)
        end
      elsif value == "remove"
        if ok == 1
          `apt purge -y #{key}`
          puts "software #{key} desinstalado.".colorize(:green)
        else
          puts "software #{key} ya está desinstalado.".colorize(:yellow)
        end
      else
        puts "Error en los datos del fichero".colorize(:red)
        puts "install para instalar y remove para desinstalar".colorize(:red)
      end
    end
  else
    puts "Se requieren privilegios de adminsitrador (root) para continuar.".colorize(:red)
    exit 1
  end
end

def check_file(input2)
  ok = system("cat files/#{input2} > /dev/null")
  if ok
    file = Hash.new
    open("files/#{input2}", 'r') do |l|
      while line = l.gets
        line = line.strip
        line = line.split(":")
        file[line[0]] = line[1]
      end
    end
    return file
  else
    puts "El fichero o directorio no existe".colorize(:red)
    puts "Pruebe 'softwarectl --help' para más información.".colorize(:red)
    exit 1
  end
end

def check_program(program)
    check = `whereis #{program} | grep bin | wc -l`.to_i
    if check == 0
      return false
    elsif check == 1
      return true
    else
      puts "Error en los datos del fichero".colorize(:red)
      puts "install para instalar y remove para desinstalar".colorize(:red)
    end
end

def status(input2)
  file = check_file(input2)
  file.each do |key,value|
    ok = check_program(key)
    if ok
      puts "-- #{key} (I) installed".colorize(:blue)
    else
      puts "-- #{key} (U) unistalled".colorize(:blue)
    end
  end
end

input1 = ARGV[0]
input2 = ARGV[1]
option(input1, input2)
