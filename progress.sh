#!/bin/bash

total=256  # Número total de pasos en la barra de progreso

(
    for ((i = 0; i <= total; i++)); do
        porcentaje=$((i * 100 / total))
        echo $porcentaje
        sleep 0.1
    done
) | dialog --title "Barra de Progreso" --gauge "Procesando..." 8 50 0
