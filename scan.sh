#!/bin/bash

# Verifica si el archivo ONLINE.txt existe
if [ ! -f "ONLINE.txt" ]; then
    echo "El archivo ONLINE.txt no existe."
    exit 1
fi

# Archivo CSV de salida
output_csv="resultado.csv"

# Encabezado del CSV
echo "IP,SSH,SAMBA,RDP" > "$output_csv"

# Escaneo de puertos para todos los IPs una vez
while IFS= read -r ip; do
    scan_result=$(nmap -p 22,139,3389 -Pn "$ip")

    ssh_result=$(echo "$scan_result" | grep "22/tcp   open" | wc -l)
    samba_result=$(echo "$scan_result" | grep "139/tcp  open" | wc -l)
    rdp_result=$(echo "$scan_result" | grep "3389/tcp open" | wc -l)
    
    # Crear una línea en el archivo CSV con los resultados
    echo "$ip,$ssh_result,$samba_result,$rdp_result" >> "$output_csv"
done < "ONLINE.txt"
