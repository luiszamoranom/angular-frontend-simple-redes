#!/bin/bash

IMAGEN="imagen_angular17_simple_redes"

CONTAINER="containe_angular17_simple_redes"

echo "Construyendo la imagen Docker..."
docker build --no-cache -t $IMAGEN .

echo "Deteniendo el contenedor existente..."
docker stop $CONTAINER 2>/dev/null || true

echo "Eliminando el contenedor existente..."
docker rm $CONTAINER 2>/dev/null || true 

echo "Ejecutando el contenedor..."
docker run -d -p 81:80 --name $CONTAINER $IMAGEN

echo "Aplicación desplegada y accesible en http://localhost:81"
