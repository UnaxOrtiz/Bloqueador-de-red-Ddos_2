#!/bin/bash

function Title {
	clear
	echo
	echo "  _____       _     _     _     _     _              _           "
   	echo " |_   _|     (_)   | |   (_)   | |   (_)            (_)          "
    	echo "   | |   ___  _  __| |    _  __| |    _  ___   ___   _   ___ ___ "
   	echo "   | |  / _ \| |/ _\`|   | |/ _\`|   | |/ _ \ / __| | | / __/ _ |"
    	echo "  _| |_| (_) | | (_| |   | | (_| |   | | (_) | (__  | || (_|  __/"
    	echo " |_____|\___/|_|\__,_|   |_|\__,_|   |_|\___/ \___| |_| \___\___|"
   	echo "________________________________________________________________ "
   	echo "                           Inhibitor_Intrusos                    "
					
	echo "    	  ︻╦̵̵͇̿̿̿̿╤── Creado Por: Mr.Robot2006 v2.0  ︻╦̵̵͇̿̿̿̿╤──       " 
	echo "-------------------------------------------------------------------------------------------"
	echo " Cualquier acción y o actividad relacionada con Inhibitor es únicamente su responsabilidad"
	echo "-------------------------------------------------------------------------------------------"
	echo
	echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "[*] Elige idioma / Select language"
	echo
	echo "#####################"
	echo "[1] Español/es"
	echo "[2] English/en"
	echo "[3] Salir"
	echo "#####################"
	echo
	echo
	read -p "[*] Elige una opcion / Choose one option: " opc
		case $opc in
				1 )	echo
					cp requisitos/es/inhibitor.sh .g
					;;
				2 )	echo
					cp requisitos/en/inhibitor.sh .
					;;
				3 )	salir
					;;
				* )	echo
					echo "$RRPLY No es una opcion valida / It is not a valid option"
					sleep 3
					bash installer.sh
		esac
		
	sudo apt install hping3	-y
	sudo apt install aircrack-ng -y
	sudo apt-get install mdk4 -y
	sudo apt-get install gnome-terminal -y
	sudo apt-get install bettercap -y
	sudo apt-get install netdiscover -y
	sudo apt install macchanger -y 
	chmod 777 inhibitor.sh 
	bash inhibitor.sh
fi
