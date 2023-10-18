#!/bin/bash

# Solicitar los tres primeros octetos
read -p "Ingresa los tres primeros octetos (ejemplo: 192.168.1): " primeros_tres_octetos

# Solicitar el primer valor del rango para el cuarto octeto
read -p "Ingresa el primer valor del rango para el cuarto octeto o presiona 'f' para el rango completo (0-255): " rango_inicio

# Verificar si se seleccionó el rango completo
if [ "$rango_inicio" == "f" ]; then
    rango_inicio=0
    rango_fin=255
else
    # Solicitar el último valor del rango para el cuarto octeto
    read -p "Ingresa el último valor del rango para el cuarto octeto: " rango_fin

    # Verificar que el rango sea válido (de 0 a 255)
    if (( rango_inicio < 0 )) || (( rango_inicio > 255 )) || (( rango_fin < 0 )) || (( rango_fin > 255 )) || (( rango_inicio > rango_fin )); then
        echo "Rango no válido. Debe ser de 0 a 255 y el primer valor debe ser menor o igual al último."
        exit 1
    fi
fi

# Crear el archivo IP.txt
archivo="IP.txt"

# Eliminar el archivo si existe previamente
if [ -e "$archivo" ]; then
    rm "$archivo"
fi

# Generar las combinaciones de IP y guardarlas en el archivo
for ((octeto4 = rango_inicio; octeto4 <= rango_fin; octeto4++)); do
    ip="$primeros_tres_octetos.$octeto4"
    echo "$ip" >> "$archivo"
done

echo "Se han generado las IP y se han guardado en $archivo."
