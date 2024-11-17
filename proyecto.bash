#!/bin/bash

clear

while true; do
    echo "Bienvenido a bash interface :D"
    echo ""
    echo "Escriba 'ayuda' para ver todos los comandos disponibles"
    echo ""
    echo "Escriba 'limpiar' para limpiar la pantalla"
    echo ""
    echo "Escriba 'salir' para salir del programa"
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
            echo "Lista de comandos personalizados:"
            echo "  actualizar sistema -> Actualiza el sistema"
            echo "  limpiar sistema -> Limpia paquetes innecesarios"
            echo "  buscar archivos -> Busca un archivo por nombre"
            echo "  ver espacio en disco -> Muestra el espacio en disco"
            echo "  monitorear el uso de memoria -> Muestra uso de memoria"
            echo "  comprobar procesos activos -> Lista los procesos activos"
            echo "  ver uso de cpu -> Muestra el uso de la CPU"
            echo "  crear directorio -> Crea un directorio"
            echo "  eliminar directorio -> Elimina un directorio vacío"
            echo "  copiar archivos -> Copia archivos de un lugar a otro"
            echo "  mover archivos -> Mueve archivos de un lugar a otro"
            echo "  listar archivos con detalles -> Lista archivos detalladamente"
            echo ""
            ;;
        "actualizar sistema")
            sudo apt-get update
            ;;
        "limpiar sistema")
            sudo apt-get autoremove && sudo apt-get autoclean
            ;;
        "buscar archivos")
            echo "Ingrese el nombre del archivo a buscar:"
            read ARCHIVO
            find . -name "*$ARCHIVO*"
            ;;
        "ver espacio en disco")
            df -h
            ;;
        "monitorear el uso de memoria")
            free -h
            ;;
        "comprobar procesos activos")
            ps aux
            ;;
        "ver uso de cpu")
            top
            ;;
        "crear directorio")
            echo "Ingrese el nombre del directorio a crear:"
            read DIR
            mkdir "$DIR"
            ;;
        "eliminar directorio")
            echo "Ingrese el nombre del directorio a eliminar:"
            read DIR
            rmdir "$DIR"
            ;;
        "copiar archivos")
            echo "Ingrese el archivo origen:"
            read ORIGEN
            echo "Ingrese el destino:"
            read DESTINO
            cp "$ORIGEN" "$DESTINO"
            ;;
        "mover archivos")
            echo "Ingrese el archivo origen:"
            read ORIGEN
            echo "Ingrese el destino:"
            read DESTINO
            mv "$ORIGEN" "$DESTINO"
            ;;
        "listar archivos con detalles")
            ls -l
            ;;
        *)
            echo "Comando no válido"
            ;;
    esac
done

