#!/bin/bash

# Instalar qtile y sus dependencias
sudo pacman -S qtile xorg xorg-xinit python-pip

# Configurar qtile
echo "Creando archivo de configuración de qtile..."
mkdir -p ~/.config/qtile
cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py

# Configurar la tecla mod de qtile
read -p "¿Desea configurar la tecla mod de qtile? (y/n) " configure_mod_key

if [ "$configure_mod_key" = "y" ]; then
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

# Instalar el gestor de archivos
read -p "¿Desea instalar un gestor de archivos? (y/n) " install_filemanager

if [ "$install_filemanager" = "y" ]; then
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

# Finalizar
echo "¡La instalación de qtile ha finalizado! Para iniciar qtile, ejecute el comando 'startx' o 'qtile'." 
echo "Para modificar la configuración de qtile en el futuro, edite el archivo ~/.config/qtile/config.py."
