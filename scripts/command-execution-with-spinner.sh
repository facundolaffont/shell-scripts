#!/bin/bash

# Define animación de espera.
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while kill -0 "$pid" 2>/dev/null; do
        for ((i=0; i<${#spinstr}; i++)); do
            printf "\r[%c] Ejecutando..." "${spinstr:$i:1}"
            sleep $delay
        done
    done
    printf "\r✔ Script finalizado.\n"
}

# Ejecuta los comandos en segundo plano y capturar su salida.
(
    echo "Iniciando Comando..."
    # Comando.
    echo "Comando finalizado."
    
) | while IFS= read -r line; do

    # Mueve el cursor arriba del spinner y muestra la línea.
    printf "\r%s\n" "$line"

done &
pid=$!

# Corre el spinner mientras se ejecutan los comandos.
spinner $pid
