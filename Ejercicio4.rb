#Ejercicio 4: Ejercicio tipo prueba
#Se tiene un archivo con diversos productos, donde la primera columna indica el nombre del producto
# y el resto de las columnas muestra el stock en distintas tiendas.
#Producto1, 10, 15, 21
#Producto2, 20, 0, 3
#Producto3, 4, 8, 0
#Producto8, 1, 2, NR
#Producto12, NR, 2, NR
#Donde NR significa no registrado.
#Se pide:
#- Crear un menú con 5 opciones, se debe validar que la opción escogida sea 1, 2, 3, 4, 5 o 6.
#- La opción 1 permite conocer la cantidad de productos existentes.
# Al seleccionar esta opción, se mostrará un submenú que permitirá:
#	- a) Mostrar la existencia por productos.
#	- b) Mostrar la existencia total por tienda.
#	- c) Mostrar la existencia total en todas las tiendas.
#	- d) Volver al menú principal.
#	*Hint:* Se debe validar que la opción ingresada sea válida.		
#- La opción 2 permite que el usuario ingrese el nombre de un producto
# y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto.
#- La opción 3 muestra los productos no registrados en cada bodega.
#- La opción 4 permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.
#- La opción 5 permite registrar un nuevo producto con su respectivo stock en cada bodega.
# (*Hint:* abrir el archivo como append).
#- Si el usuario ingresa la opción 6 el programa sale,
# si ingresa cualquier otra opción se debe mostrar que la opción es inválida,
# y mostrar el menú nuevamente y la opción de elegir.

#1. Información de problema

options_menu = ['Opción 1: Mostrar cantidad de productos existentes (se abrirá submenú para más opciones)',
                'Opción 2: Mostrar cantidad de stock de un producto en bodega',
                'Opción 3: Mostrar nombres de productos no registrados en bodega',
                'Opción 4: Mostrar productos con existencia menor a la indicada',
                'Opción 5: Registrar un nuevo producto con stock a bodega',
                'Opción 6: Salir del menú']

options_submenu = ['Opción 1: Mostrar existencias en stock según producto',
                    'Opción 2: Mostrar existencias totales por tienda',
                    'Opción 3: Mostrar existencias totales en todas las tiendas',
                    'Opción 4: Volver al menú principal']

instructions = "Seleccione una opción para avanzar :) \n"

instructions_new = "Seleccione una nueva opción para avanzar :) \n"

option_selected = 0

option_exit = options_menu.length

#2. Declarar procesamiento
def show(message)
    puts message
end

def show_menu(options)
    menu_text = options.join("\n")
    puts menu_text
end

def get_stock(file_name)
    stock = []
    file = File.open(file_name, 'r')
    file.readlines.each do |line|
      product = {}
      stock_unfinished_group = {}
      line = line.chomp.split(', ')
      product[:name] = line[0]
      stock_unfinished_group[:stock_unfinished] = line[1..line.length]
      product[:stock] = stock_unfinished_group[:stock_unfinished].map(&:to_i)
      stock.push(product)
    end
    return stock
end


def select_options(options)
    selected_alternative = gets.chomp
    transformed_alternative = selected_alternative.to_f.to_i
    options_quantity = options.length

    while !(0 < transformed_alternative and transformed_alternative <= options_quantity)
        puts "Escribiste '#{selected_alternative}', y ésta es una opción no válida :(."
        puts "Debes escoger un número entre '1' y '#{options_quantity} :)'\n"
        selected_alternative = gets.chomp
        transformed_alternative = selected_alternative.to_f.to_i
    end
    return transformed_alternative
end

# Opción 1: mostrar cantidad de existencias (submenú)
def show_inventory(options)
    puts 'Seleccionaste la opción 1'

end

#Opción A - 1
def show_all(file_name)
    stock = get_stock(file_name)
    print stock
end

#Opción B - 2 existencia total por tienda
def show_all_by_store(file_name)
    stock = [0,0,0]
    get_stock(file_name).each do |element|
        stock.each_with_index do |value, i|
            stock[i] = value + element[:stock][i]
        end
    end
    stock.each_with_index do |value, i|
        print "La tienda #{i + 1} tiene un stock de #{value}.\n"
    end
end

#Opción C - 3 existencias totales en todas las tiendas
def show_all_in_warehouse(file_name)
    stock_total = get_stock(file_name).map { |value| value[:stock].sum }.sum
    puts "El stock en bodegas es de #{stock_total} unidades"
end

# Opción 2:
def stock_in_warehouse(file_name)
end


# Opción 6: cerrar sesión
def close_session
    print "Elegiste salir, kbye~"
    exit
end

# 3. Procesar
show(instructions)
show_menu(options_menu)

while (option_selected != option_exit) do
    option_selected = select_options(options_menu)
    case option_selected
    when 1
        show_inventory(options_submenu)
        show_menu(options_submenu)
        while (option_selected != option_exit) do
            option_selected = select_options(options_submenu)
            case option_selected
            when 1
                show_all('inventory.txt')
            when 2
                show_all_by_store('inventory.txt')
            when 3
                show_all_in_warehouse('inventory.txt')
            when 4
                puts "Seleccionó la opción de cierre de submenú."
                break
            end
        end
        puts "Ha vuelto al menú principal."
        show(options_menu)
        show(instructions_new)
    when 2
        show(instructions_new)
    when 3
        show(instructions_new)
    when 4
        show(instructions_new)
    when 5
        show(instructions_new)
    when option_exit
        close_session
        break
    end
end
