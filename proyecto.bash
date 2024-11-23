#!/bin/bash

clear

cd /home/froy/Data

echo "Bienvenido a bash interface :D"
echo ""
echo "Escriba 'ayuda' para ver todos los comandos disponibles"
echo ""
echo "Escriba 'limpiar' para limpiar la pantalla"
echo ""
echo "Escriba 'salir' para salir del programa"
echo ""

while true; do
    echo ""
    echo "Directorio actual:"
    echo $PWD
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
            echo "  actualizar sistema -> Actualiza el sistema"
            echo "  limpiar sistema -> Limpia paquetes innecesarios"
            echo "  buscar archivos -> Busca archivos por nombre en la direccion actual"
            echo "  ver espacio en disco -> Muestra el espacio en disco"
            echo "  monitorear el uso de memoria -> Muestra uso de memoria"
            echo "  procesos activos -> Lista los procesos activos"
            echo "  ver tareas -> Muestra las tareas en tiempo real"
            echo "  crear directorio -> Crea un directorio"
            echo "  eliminar directorio -> Elimina un directorio vacío"
            echo "  copiar archivos -> Copia archivos de un lugar a otro"
            echo "  mover archivos -> Mueve archivos de un lugar a otro"
            echo "  listar -> Lista archivos y directorios de la direccion actual"
	    echo "  listar por tipo -> Lista solamente los archivos de la direccion actual con el formato solicitado"
            echo "  moverse ->  moverse a la direccion solicitada"
	    echo "  regresar -> regresar un nivel de la direccion actual"
	    echo ""
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
        "ver espacio en disco")
            df -h
            ;;
        "monitorear el uso de memoria")
            free -h
            ;;
        "comprobar procesos activos")
            ps aux
            ;;
        "ver tareas")
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
	    echo "Ingrese la direccion a ir:"
	    read DESTINO
	    cd $DESTINO
	    ;;
	"regresar")
	    cd ..
	    ;;
        *)
            echo "Comando no válido"
            ;;
    esac
done

