#!/bin/bash

clear

cd

echo "Bienvenido a bash interface :D"
echo ""

while true; do
    echo ""
    echo -e "Ingrese " "\033[0;36mayuda\033[0m" " para ver todos los comandos disponibles"
    echo ""
    echo -e "Ingrese " "\033[0;36mlimpiar\033[0m" " para limpiar la pantalla"
    echo ""
    echo -e "Ingrese " "\033[0;36msalir\033[0m" " para salir del programa"
    echo ""
    echo "Directorio actual:"
    echo -e "\033[0;33m$PWD\033[0m"
    echo ""
    echo "Ingrese un comando:"
    read COMANDO
    echo ""

    case $COMANDO in
        salir)
            echo "¡Nos vemos pronto!"
            break
            ;;
	limpiar)
	    clear
	    ;;
        ayuda)
            echo "Lista de comandos:"
            echo -e "1. \033[0;36mactualizar sistema\033[0m" " -> Actualiza el sistema"
            echo -e "2. \033[0;36mlimpiar sistema\033[0m" " -> Limpia paquetes innecesarios"
	    echo -e "3. \033[0;36mreiniciar\033[0m" " -> Reinicia el equipo"
            echo -e "4. \033[0;36mapagar\033[0m" " -> Apaga el equipo"
	    echo -e "5. \033[0;36mbuscar archivos\033[0m" " -> Busca archivos por nombre en la direccion actual"
            echo -e "6. \033[0;36mespacio en disco\033[0m" " -> Muestra el espacio en disco"
            echo -e "7. \033[0;36muso de memoria\033[0m" " -> Muestra uso de memoria"
            echo -e "8. \033[0;36mprocesos activos\033[0m" " -> Lista los procesos activos"
            echo -e "9. \033[0;36mtareas\033[0m" " -> Muestra las tareas en tiempo real"
            echo -e "10. \033[0;36mcrear directorio\033[0m" " -> Crea un directorio"
            echo -e "11. \033[0;36meliminar directorio\033[0m" " -> Elimina un directorio vacío"
            echo -e "12. \033[0;36mcopiar archivos\033[0m" " -> Copia archivos de un lugar a otro"
            echo -e "13. \033[0;36mmover archivos\033[0m" " -> Mueve archivos de un lugar a otro"
            echo -e "14. \033[0;36mlistar\033[0m -> Lista archivos y directorios de la direccion actual"
	    echo -e "15. \033[0;36mlistar por tipo\033[0m -> Lista solamente los archivos de la direccion actual con el formato solicitado"
            echo -e "16. \033[0;36mmoverse\033[0m" " ->  Moverse a la direccion solicitada"
	    echo -e "17. \033[0;36mregresar\033[0m" " -> Regresar un nivel de la direccion actual"
	    echo -e "18. \033[0;36mregresar home\033[0m" " -> Regresar al directorio raiz"
	    echo -e "19. \033[0;36mip\033[0m -> Muestra la ip local"
            echo -e "20. \033[0;36mhistorial de comandos\033[0m -> Muestra el historial de comandos utilizados"
            echo -e "21. \033[0;36minstalar\033[0m" " -> Instala el paquete solicitado"
            echo -e "22. \033[0;36mdesinstalar\033[0m" " -> Desinstala el paquete solicitado"
            echo -e "23. \033[0;36mactualizar permisos\033[0m" "-> Actualiza los permisos de un archivo o carpeta"
            echo -e "24. \033[0;36muso de red\033[0m" " -> Muestra las estadisticas de uso de la red"
            echo -e "25. \033[0;36mlogs\033[0m" " -> Muestra los logs del sistema"
            echo -e "26. \033[0;36marbol de procesos\033[0m" " -> Muestra el arbol de procesos"
	    echo -e "27. \033[0;36meditor de texto\033[0m" " -> Abre el editor de texto nano"
            echo -e "28. \033[0;36mejecutar bash\033[0m" " -> Ejecuta el archivo de tipo bash solicitado"
	    ;;
        "actualizar sistema")
            sudo apt-get update
	    echo ""
	    echo -e "\033[0;32mSistema actualizado.\033[0m"
            ;;
        "limpiar sistema")
            sudo apt-get autoremove && sudo apt-get autoclean

	    echo ""
	    echo -e "\033[0;32mEl sistema ha sido limpiado.\033[0m"
            ;;
	"reiniciar")
	    echo "¿Seguro que desea reiniciar el sistema? s/n"
	    read RESPUESTA
	    if [ "$RESPUESTA" == "s" ]; then
		sudo shutdown -r now
	    else
		echo -e "\033[0;31mSe canceló el reinicio.\033[0m"
	    fi
	    ;;
	"apagar")
	    echo "¿Seguro que desea apagar el sistema? s/n"
	    read RESPUESTA
	    if [ "$RESPUESTA" == "s" ]; then
		sudo shutdown now
	    else
		echo -e "\033[0;32mSe canceló el apagado.\033[0m"
	    fi
	    ;;
        "buscar archivos")
            echo "Ingrese el nombre del archivo a buscar:"
            read ARCHIVO
	    echo ""
            find . -name "*$ARCHIVO*"
            ;;
        "espacio en disco")
            df -h
            ;;
        "uso de memoria")
            free -h
            ;;
        "procesos activos")
            ps aux
            ;;
        "tareas")
            top
            ;;
        "crear directorio")
            echo "Ingrese el nombre del directorio a crear:"
            read DIR
            mkdir "$DIR"
	    echo -e "\033[0;32mDirectorio $DIR creado.\033[0m"
            ;;
        "eliminar directorio")
            echo "Ingrese el nombre del directorio a eliminar (debe estar vacio):"
            read DIR
            rmdir "$DIR"
            ;;
        "copiar archivos")
            echo "Ingrese el archivo origen con direccion completa:"
            read ORIGEN
            echo "Ingrese la direccion de destino:"
            read DESTINO
            cp "$ORIGEN" "$DESTINO"
            ;;
        "mover archivos")
            echo "Ingrese el archivo origen con direccion completa:"
            read ORIGEN
            echo "Ingrese la direccion de destino:"
            read DESTINO
            mv "$ORIGEN" "$DESTINO"
            ;;
        "listar")
            ls
            ;;
	"listar por tipo")
	    echo "Ingrese el tipo de archivo a listar (txt, pdf, etc):"
	    read TIPO
	    ls *.$TIPO
	    ;;
	"moverse")
	    echo "Ingrese la direccion a moverse:"
	    read DESTINO
	    cd $DESTINO
	    ;;
	"regresar")
	    cd ..
	    ;;
	"regresar home")
	    cd
	    ;;
        "ip")
            echo "IP local:"
	    hostname -I
            ;;
        "historial de comandos")
            history
            ;;
        "instalar")
	    echo "Ingrese el paquete a instalar:"
	    read PAQUETE
            sudo apt install $PAQUETE
            ;;
        "desinstalar")
            echo "Ingrese el paquete a desinstalar:"
	    read PAQUETE
	    sudo apt remove $PAQUETE
            ;;
        "actualizar permisos")
	    echo "Ingrese el archivo a carpeta a cambiar permiso"
	    read ARCHIVO
            echo "Ingrese los permisos a actualizar (+x por ejemplo)"
	    read PERMISOS
            chmod $PERMISOS $ARCHIVO
            ;;
        "uso de red")
            ifconfig
            ;;
        "logs")
            tail -f /var/log/syslog
            ;;
        "arbol de procesos")
            pstree
            ;;
	"editor de texto")
	    nano
	    ;;
	"ejecutar bash")
	    echo "Ingrese el archivo bash a ejecutar:"
	    read ARCHIVO
	    echo ""
	    bash $ARCHIVO
	    ;;
        *)
            echo "Comando no válido"
            ;;
    esac
done
