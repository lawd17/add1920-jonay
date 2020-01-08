#!/usr/bin/env ruby
print "Introduce el año del curso?"
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
end
