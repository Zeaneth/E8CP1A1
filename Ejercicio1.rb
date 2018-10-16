#Ejercicio 1: Escribiendo un archivo básico
#
#- Crear un método que reciba dos strings, este método creará un archivo index.html y pondrá como párrafo cada uno de los strings recibidos.
#- Crear un método similar al anterior, que además pueda recibir un arreglo. Si el arreglo no está vacío, agregar debajo de los párrafos una lista ordenada con cada uno de los elementos.
#- Crear un tercer método que además pueda recibir un color. Agregar color de fondo a los párrafos.
#- El retorno de los métodos debe devolver nil.

puts "Escribe dos párrafos"
    parrafo1 = gets.chomp.to_s
    parrafo2 = gets.chomp.to_s

def write2p (str1, str2)
    file_name = "index.html"
    file = File.open(file_name,'w') #Se indica una ubicación relativa, dependiendo del lugar donde se ubique al correr el archivo.
    file << (str1 + "\n")
    file << (str2 + "\n")
end

write2p(parrafo1,parrafo2)