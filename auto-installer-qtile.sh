#!/bin/bash

echo "Este script instalará qtile y configurará algunos ajustes básicos."
echo ""

# Preguntar al usuario si desea instalar qtile
read -p "¿Desea instalar qtile? (y/n) " install_qtile

if [ "$install_qtile" = "y" ]; then
    echo "Instalando qtile..."
    sudo pacman -S qtile

    # Preguntar al usuario si desea instalar un terminal
    read -p "¿Desea instalar un terminal para qtile? (y/n) " install_terminal

    if [ "$install_terminal" = "y" ]; then
        # Instalar el terminal seleccionado por el usuario
        echo "Seleccione un terminal para instalar:"
        echo "1. Alacritty"
        echo "2. Konsole"
        read -p "Opción: " terminal_option

        if [ "$terminal_option" = "1" ]; then
            echo "Instalando Alacritty..."
            sudo pacman -S alacritty
        elif [ "$terminal_option" = "2" ]; then
            echo "Instalando Konsole..."
            sudo pacman -S konsole
        else
            echo "Opción inválida. No se instalará ningún terminal."
        fi
    fi

    # Preguntar al usuario si desea instalar un navegador
    read -p "¿Desea instalar un navegador para qtile? (y/n) " install_browser

    if [ "$install_browser" = "y" ]; then
        # Instalar el navegador seleccionado por el usuario
        echo "Seleccione un navegador para instalar:"
        echo "1. Firefox"
        echo "2. Chromium"
        read -p "Opción: " browser_option

        if [ "$browser_option" = "1" ]; then
            echo "Instalando Firefox..."
            sudo pacman -S firefox
        elif [ "$browser_option" = "2" ]; then
            echo "Instalando Chromium..."
            sudo pacman -S chromium
        else
            echo "Opción inválida. No se instalará ningún navegador."
        fi
    fi

    # Preguntar al usuario si desea instalar un editor de texto
    read -p "¿Desea instalar un editor de texto para qtile? (y/n) " install_editor

    if [ "$install_editor" = "y" ]; then
        # Instalar el editor de texto seleccionado por el usuario
        echo "Seleccione un editor de texto para instalar:"
        echo "1. Nano"
        echo "2. Vim"
        read -p "Opción: " editor_option

        if [ "$editor_option" = "1" ]; then
            echo "Instalando Nano..."
            sudo pacman -S nano
        elif [ "$editor_option" = "2" ]; then
            echo "Instalando Vim..."
            sudo pacman -S vim
        else
            echo "Opción inválida. No se instalará ningún editor de texto."
        fi
    fi
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
fi
echo "¡Gracias por utilizar este script! Si desea configurar qtile en el futuro, ejecute el comando 'qtile config'."
