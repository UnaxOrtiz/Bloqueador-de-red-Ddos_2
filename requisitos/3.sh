#!bin/bash

source installer.sh

Title
echo "[3] Escanear dispositivos conectados a un Wifi Ajeno"
echo 
sudo airmon-ng
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red (Ej: wlan0): " interfaz
read -p "[*] Cortar la salida a internet para evitar futuros errores? (y/n): " opc2
echo
if [ $opc2 = y ]
	then
		sudo airmon-ng check kill >/dev/null
	else
echo "OK"
fi
sudo ifconfig $interfaz promisc >/dev/null
sudo airmon-ng start $interfaz >/dev/null
echo "======================="
echo "Activando Modo Monitor"
echo "======================="
echo "--->""                  |"
sleep 1
echo "-------->""             |"
sleep 1
echo "--------------->""      |"
sleep 1
echo "--------------------->""|"
echo "======================="
sudo airmon-ng 
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red en modo Monitor (Ej: wlan0mon o wlan0): " interfaz2
echo
sudo ifconfig $interfaz2 promisc >/dev/null
sudo ifconfig $interfaz2 down >/dev/null
sudo macchanger -a $interfaz2 >/dev/null
sudo ifconfig $interfaz2 up >/dev/null
echo "======================="
echo " Activando Modo Seguro"
echo "======================="
echo "--->""                  |"
sleep 1
echo "-------->""             |"
sleep 1
echo "--------------->""      |"
sleep 1
echo "--------------------->""|"
echo "======================="
Title
echo "[#] Pulse Ctrl + c (Cuando aparezca por pantalla el Wifi objetivo, puede tardar hasta 1 minuto)"
echo
sudo wash -2 -5 -a -i $interfaz2
read -p "[*] Copia el BSSID del Wifi Objetivo y pegelo a continuacion: " bssid
read -p "[*] Copia el Canal (Ch) del Wifi Objetivo y pegelo a continuacion: " ch
echo
sleep 1
echo "Listo"
echo "Pulse Ctrl + c para finalizar el Scaneo"
sleep 3
sudo airodump-ng -c $ch --bssid $bssid $interfaz2 --band abg
sleep 1
echo
echo "[#] Desactivando Ataque y Protocolos"
echo
sudo ifconfig $interfaz2 down >/dev/null
sudo macchanger -p $interfaz2 >/dev/null
sudo ifconfig $interfaz2 up >/dev/null
sudo ifconfig $interfaz2 -promisc >/dev/null
sudo airmon-ng stop $interfaz2 >/dev/null
sudo ifconfig $interfaz -promisc >/dev/null
sudo systemctl restart NetworkManager.service >/dev/null
echo "=============================="
echo "        Desactivando"
echo "Ataque/Modo Monitor/Seguridad"
echo "=============================="
echo "-------->""                    |"
sleep 1
echo "--------------->""             |"
sleep 1
echo "---------------------->""      |"
sleep 1
echo "---------------------------->""|"
echo "=============================="
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
			2 )	bash requisitos/3.sh
				;;
			3 )	exit
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
