#!/bin/bash

clear

echo "Bienvenido a bash interface :D"
echo ""
echo "Escriba ayuda para ver todos los comandos disponibles"
echo ""
echo "Escriba salir para salir del programa"
echo ""

echo "Ingrese un comando:"
read COMANDO
echo ""

while [ $COMANDO != "salir" ]; do
	if [ $COMANDO == "ayuda" ]; then
		echo "procesos - muestra todos los procesos en ejecución"
		echo ""

	else
		echo "Comando no valido"
		echo ""
	fi

	echo "Ingrese un comando:"
	read COMANDO
	echo ""
done


