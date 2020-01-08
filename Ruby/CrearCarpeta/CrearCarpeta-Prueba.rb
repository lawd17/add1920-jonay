#!/usr/bin/env ruby
puts "Introduce 'c' para crear carpeta y 'r' para borrarla."
letra = gets.chop

if letra =='c'
  puts "Introduce el año del curso?"
  curso = gets.chomp
  if curso == /[0-9]{4}/
    okey = system ("mkdir -p curso#{curso}/{idp,lnd,fuw}")
    if okey == false
      print "Ha ocurrido un error"
      exit 1
    end
  else
    puts "Usage:"
    puts "Error al introducir el dato"
    puts "Se deben introducir 4 digitos"
    puts "Ejemplo:"
    puts "Curso 2018/2019 -> 1819"
    exit 1
  end
end
if letra =='r'
  puts "Introduce el año del curso?"
  curso = gets.chomp
  if curso == /[0-9]{4}/
    okey = system ("rm -r curso#{curso}")
    if okey == false
      print "Ha ocurrido un error"
      exit 1
    end
  else
    puts "Usage:"
    puts "Error al introducir el dato"
    puts "Se deben introducir 4 digitos"
    puts "Ejemplo:"
    puts "Curso 2018/2019 -> 1819"
    exit 1
  end
end
if letra != 'c' or letra != 'r'
  puts "Error introduce 'c' o 'r'"
  exit 1
end
