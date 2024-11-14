# Proyecto creado con la idea de "una imagen vale más de mil palabras"
# Su uso es para hacer un registro de palabras sin repetir para hacer una lluvia de palabras

colection = []

# # Código para probar que colection tiene más de 100 elementos
# 100.times do |x|
#     colection.push('manzana')
# end

def bienvenida(colection)
    puts "Almacenador de palabras en funcionamiento. Actualmente hay #{colection.count} palabras."
    puts "Elija una acción:"
end

def show_list(colection)
    if colection.empty? # .empty? es un método que ayuda a identificar que un array está vacío
        puts " "
        puts "No hay palabras en la lista"
        puts " "
    else
        puts " " 
        puts "Mostrando palabras de la lista:"
        colection.each_with_index do |x, index| # .each_with_index permite añadir index como param
            puts "#{index + 1} - #{x}"
        end
        puts " "
    end
end

def menu(colection)
    bienvenida(colection)
    puts "1 - Añadir palabra"
    puts "2 - Eliminar palabra"
    puts "3 - Ver lista"
    puts "4 - Guardar lista a un archivo"
    puts "5 - Salir"
end

def add_word(colection)
    puts "Escriba la palabra a añadir a la lista:"
    word = gets.chomp.downcase
    if colection.include?(word)
        puts "- Esa palabra ya existe"
        puts " "
    else 
        colection.push(word)
        puts "Se ha añadido la palabra:"
        puts "- #{word}"
        puts " "
    end
end

def delete_word(colection)
    puts "Escriba la palabra a eliminar de la lista:"
    word = gets.chomp.downcase
    if colection.include?(word)
        puts "Se ha eliminado la palabra de la lista"
        puts "Palabra eliminada:"
        puts "- #{word}"
        colection.delete(word)
        puts " "
    else
        puts "La palabra es incorrecta o no existe"
        puts " "
    end
end

def save_list(colection)
    # Creando variable para la fecha y hora actual
    current_date = Time.now.strftime("%d-%m-%y %H-%M-%S")

    puts "Guardando el contenido en un archivo..."
    File.write("#{current_date}.txt", colection) # Anotando el array de colection a un archivo con fecha actual
    puts "Se ha guardado el registro en el archivo con nombre '#{current_date}'"
end

# Corriendo el programa

while true # Es necesario este true para que se cumpla el bucle infinito
    menu(colection)

    # Impresionador
    if colection.count > 100
        puts "Hay más de 100 palabras :O"
    elsif colection.count > 1000
        puts "HAY MÁS DE MIL PALABRAS"
        puts "FOA XABAL"
    end

    option = gets.chomp.to_i
    

    case option
        when 1
            add_word(colection)
        when 2
            delete_word(colection)
        when 3
            show_list(colection)
        when 4
            save_list(colection)
        when 5
            puts "Cerrando..."
            break
	# Esta línea se suponía que servía (el * hace de negador en ruby)
        # when *(1..4)
           # puts "Introduzca una opción válida"
    end
end