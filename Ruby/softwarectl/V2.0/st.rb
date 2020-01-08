#!/usr/bin/ruby
def check_file
  ok = system("cat files/#{ARGV[1]} > /dev/null")
  if ok
    file = Hash.new
    open("files/#{ARGV[1]}", 'r') do |l|
      while line = l.gets
        line = line.split(":")
        file[line[0]] = line[1]
      end
    end
    return file
  else
    puts "El fichero o directorio no existe".colorize(:red)
  end
end

def check_program(program)
    check = `whereis #{program} | grep bin | wc -l`.to_i
    bool = 0
    if check == 0
      bool = 0
      return bool
    elsif check == 1
      bool = 1
      return bool
    else
      puts "Error en los datos del fichero".colorize(:red)
      puts "install para instalar y remove para desinstalar".colorize(:red)
    end
end

def status(file)
  file.each do |key,value|
    bool = check_program(key)
    if bool
      puts "-- #{key} (I) installed".colorize(:light)
    else
      puts "-- #{key} (U) unistalled".colorize(:bold)
    end
  end
end
