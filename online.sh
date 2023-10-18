#!/bin/bash

# Función para manejar la señal SIGINT (CTRL + C)
ctrl_c() {
    echo "Deteniendo la ejecución del script..."
    exit 0
}

# Capturar la señal SIGINT (CTRL + C)
trap ctrl_c SIGINT

# Verifica si el archivo IP.txt existe
if [ ! -f "IP.txt" ]; then
    echo "El archivo IP.txt no existe."
    exit 1
fi

# Códigos ANSI para establecer el color rojo
RED='\033[0;31m'
NC='\033[0m' # No Color

# Itera sobre cada línea del archivo IP.txt
while IFS= read -r ip; do
    # Realiza 2 pings a la dirección IP
    if ping -c 2 "$ip" >/dev/null 2>&1; then
        # Imprime el mensaje "responde al ping" en rojo
        echo -e "${RED}${ip} responde al ping${NC}"
        # Agrega la dirección IP a ONLINE.txt
        echo "$ip" >> "ONLINE.txt"
    else
        echo "$ip no responde al ping."
    fi
done < "IP.txt"
