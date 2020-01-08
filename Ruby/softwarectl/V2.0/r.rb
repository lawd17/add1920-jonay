#!/usr/bin/ruby
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
