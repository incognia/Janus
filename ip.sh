# Solicita los primeros tres octetos
primeros_tres_octetos = input("Ingresa los primeros tres octetos (Ejemplo: 192.168.1): ")

# Solicita el primer valor del rango del último octeto
primer_valor = int(input("Ingresa el primer valor del rango del último octeto: "))

# Solicita el último valor del rango del último octeto
ultimo_valor = int(input("Ingresa el último valor del rango del último octeto: "))

# Validación de los valores del rango
if 0 <= primer_valor <= 255 and 0 <= ultimo_valor <= 255 and primer_valor <= ultimo_valor:
    with open("IP.txt", "w") as archivo:
        for i in range(primer_valor, ultimo_valor + 1):
            ip = f"{primeros_tres_octetos}.{i}\n"
            archivo.write(ip)
    print(f"Se ha creado el archivo 'IP.txt' con las direcciones IP en el rango especificado.")
else:
    print("Los valores del rango del último octeto son inválidos.")
