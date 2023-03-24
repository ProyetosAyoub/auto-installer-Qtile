#!/bin/bash

# Actualizar la base de datos de paquetes e instalar los paquetes necesarios
sudo pacman -Syu qtile thunar fish

# Configurar el gestor de ventana styling
echo "exec qtile" >> ~/.xinitrc

# Configurar el editor de texto Thunar
echo "export EDITOR=thunar" >> ~/.bashrc

# Configurar el terminal Fish
echo "export SHELL=/usr/bin/fish" >> ~/.bashrc

# Reiniciar el sistema después de la instalación
read -p "La instalación ha finalizado. ¿Desea reiniciar el sistema ahora? (s/n) " choice
case "$choice" in
  s|S ) sudo reboot;;
  n|N ) echo "Por favor, reinicie el sistema manualmente más tarde.";;
  * ) echo "Opción inválida. Por favor, reinicie el sistema manualmente más tarde.";;
esac

# Consejos posteriores a la instalación
echo "¡La instalación ha finalizado! Aquí hay algunos consejos adicionales para comenzar a usar Qtile:"
echo "- Consulte la documentación oficial de Qtile para aprender más sobre cómo personalizar su configuración: https://qtile.org"
echo "- Pruebe algunos de los atajos de teclado predeterminados de Qtile: Mod + Enter para abrir una nueva terminal, Mod + Shift + c para cerrar una ventana, etc."
echo "- Personalice su archivo de configuración de Qtile (~/.config/qtile/config.py) para ajustar aún más el comportamiento de su sistema de ventana."
