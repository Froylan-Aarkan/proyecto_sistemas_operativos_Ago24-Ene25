#!/bin/bash

clear

cd /home/froy/Data

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
            echo -e " \033[0;36mactualizar sistema\033[0m" " -> Actualiza el sistema"
            echo -e " \033[0;36mlimpiar sistema\033[0m" " -> Limpia paquetes innecesarios"
            echo -e " \033[0;36mbuscar archivos\033[0m" " -> Busca archivos por nombre en la direccion actual"
            echo -e " \033[0;36mespacio en disco\033[0m" " -> Muestra el espacio en disco"
            echo -e " \033[0;36muso de memoria\033[0m" " -> Muestra uso de memoria"
            echo -e " \033[0;36mprocesos activos\033[0m" " -> Lista los procesos activos"
            echo -e " \033[0;36mtareas\033[0m" " -> Muestra las tareas en tiempo real"
            echo -e " \033[0;36mcrear directorio\033[0m" " -> Crea un directorio"
            echo -e " \033[0;36meliminar directorio\033[0m" " -> Elimina un directorio vacío"
            echo -e " \033[0;36mcopiar archivos\033[0m" " -> Copia archivos de un lugar a otro"
            echo -e " \033[0;36mmover archivos\033[0m" " -> Mueve archivos de un lugar a otro"
            echo -e " \033[0;36mlistar\033[0m -> Lista archivos y directorios de la direccion actual"
	    echo -e " \033[0;36mlistar por tipo\033[0m -> Lista solamente los archivos de la direccion actual con el formato solicitado"
            echo -e " \033[0;36mmoverse\033[0m" " ->  Moverse a la direccion solicitada"
	    echo -e " \033[0;36mregresar\033[0m -> Regresar un nivel de la direccion actual"
	    echo -e " \033[0;36mip\033[0m -> Muestra la ip local"
            echo -e " \033[0;36mhistorial de comandos\033[0m -> Muestra el historial de comandos utilizados"
            echo -e " \033[0;36mmontar dispositivos\033[0m" "-> "
            echo -e " \033[0;36mdesmontar dispositivos\033[0m" "-> "
            echo -e " \033[0;36minstalar\033[0m" " -> Instala el paquete solicitado"
            echo -e " \033[0;36mdesinstalar\033[0m" " -> Desinstala el paquete solicitado"
            echo -e " \033[0;36mactualizar permisos\033[0m" "-> Actualiza los permisos de un archivo o carpeta"
            echo -e " cambiar propietario de archivos o carpeta"
            echo -e " \033[0;36muso de red\033[0m" " -> Muestra las estadisticas de uso de la red"
            echo -e " obtener logs del sistema en tiempo real"
            echo -e " \033[0;36marbol de procesos\033[0m" " -> Muestra el arbol de procesos"
            ;;
        "actualizar sistema")
            sudo apt-get update
	    echo ""
	    echo "Sistema actualizado"
            ;;
        "limpiar sistema")
            sudo apt-get autoremove && sudo apt-get autoclean

	    echo ""
	    echo "El sistema ha sido limpiado"
            ;;
        "buscar archivos")
            echo "Ingrese el nombre del archivo a buscar:"
            read ARCHIVO
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
	    echo "Directorio $DIR creado."
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
        "ip")
            echo "IP local:"
	    hostname -I
            ;;
        "historial de comandos")
            history | grep "$1"
            ;;
        "montar dispositivos")
            sudo mount
            ;;
        "desmontar dispositivos")
            sudo umount
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
        "Actualizar permisos de un archivo o carpeta")
            alias permisos='chmod'
            ;;
        "Cambiar propietario de archivos o carpetas")
            alias propietario='chown'
            ;;
        "uso de red")
            ifconfig
            ;;
        "Obtener logs del sistema en tiempo real")
            alias logs='tail -f /var/log/syslog'
            ;;
        "arbol de procesos")
            pstree
            ;;

        *)
            echo "Comando no válido"
            ;;
    esac
done

