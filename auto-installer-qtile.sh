#!/bin/bash

# Instalar dependencias
sudo apt-get update
sudo apt-get install -y git python-pip python-xcffib libcairo2-dev libpango1.0-dev libxcb-ewmh-dev libxcb-util0-dev libxcb1-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libxcb-xrm-dev python-dbus python-gobject python-xlib python3-thunar fish

# Instalar QTile
pip install xcffib
pip install --no-cache-dir cairocffi
pip install qtile

# Clonar el gestor de ventana styling
git clone https://github.com/antoniosarosi/wal-qtile.git ~/.config/qtile

# Copiar el archivo de configuración de shortcuts
wget https://raw.githubusercontent.com/qtile/qtile/master/libqtile/resources/default_config.py -O ~/.config/qtile/config.py

# Configurar Thunar como editor de texto predeterminado
xdg-mime default Thunar.desktop text/plain

# Configurar Fish como shell predeterminado
chsh -s /usr/bin/fish

# Mensaje de finalización y reinicio del sistema
echo "¡Instalación completada! Por favor, reinicie el sistema para que los cambios tengan efecto."
