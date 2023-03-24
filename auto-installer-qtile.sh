#!/bin/bash

echo "¡Bienvenido al instalador de qtile!"

# Preguntar al usuario si desea instalar un gestor de archivos
read -p "¿Desea instalar un gestor de archivos? (y/n) " install_filemanager

if [ "$install_filemanager" = "y" ]; then
    # Instalar el gestor de archivos seleccionado por el usuario
    echo "Seleccione un gestor de archivos para instalar:"
    echo "1. Thunar"
    echo "2. Nautilus"
    read -p "Opción: " filemanager_option

    if [ "$filemanager_option" = "1" ]; then
        echo "Instalando Thunar..."
        sudo pacman -S thunar
    elif [ "$filemanager_option" = "2" ]; then
        echo "Instalando Nautilus..."
        sudo pacman -S nautilus
    else
        echo "Opción inválida. No se instalará ningún gestor de archivos."
    fi
fi

# Preguntar al usuario si desea configurar qtile
read -p "¿Desea configurar qtile? (y/n) " configure_qtile

if [ "$configure_qtile" = "y" ]; then
    # Crear el archivo de configuración de qtile
    echo "Creando archivo de configuración de qtile..."
    mkdir -p ~/.config/qtile
    cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py

    # Preguntar al usuario si desea configurar la tecla mod de qtile
    read -p "¿Desea configurar la tecla mod de qtile? (y/n) " configure_mod_key

    if [ "$configure_mod_key" = "y" ]; then
        # Configurar la tecla mod de qtile
        echo "Seleccione una tecla mod:"
        echo "1. Super (tecla Windows)"
        echo "2. Alt"
        read -p "Opción: " mod_key_option

        if [ "$mod_key_option" = "1" ]; then
            echo "Configurando tecla mod a Super..."
            sed -i 's/mod = "mod4"/mod = "mod4"/g' ~/.config/qtile/config.py
        elif [ "$mod_key_option" = "2" ]; then
            echo "Configurando tecla mod a Alt..."
            sed -i 's/mod = "mod4"/mod = "mod1"/g' ~/.config/qtile/config.py
        else
            echo "Opción inválida. La tecla mod no se configurará."
        fi
    fi

    echo "qtile ha sido instalado y configurado correctamente."
else
    echo "qtile ha sido instalado correctamente."
fi

echo "¡Gracias por utilizar este script! Si desea configurar qtile en el futuro, ejecute el comando 'qtile config'."
