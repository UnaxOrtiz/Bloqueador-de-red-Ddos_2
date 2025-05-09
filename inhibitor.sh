#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

source "DIR/installer.sh"

Title
echo "                          ========================================================"
echo "                                                 Utilidades"
echo "                          ========================================================"
echo "                          [1] Estado Tarjeta de Red"
echo "                          [2] Escaner avanzado Redes Wifi"
echo "                          [3] Escanear dispositivos conectados a un Wifi Ajeno"
echo "                          ========================================================"
echo "                                             Ataques en Red/Lan"
echo "                          ========================================================"
echo "                          [4] Incomunicar a un Dispositivo/IP"
echo "                          [5] Relentizar el flujo de datos del Router"
echo "                          ========================================================"
echo "                                        Ataques a Redes Wifi Ajenos"
echo "                          ========================================================"
echo "                          [6] Desconectar a un disposito de una Red Wifi"
echo "                          [7] Desconectar a todos los dispositivos de una Red Wifi"
echo "                          [8] Desconectar a todas las Redes Wifi de un Canal"
echo "                                                 -----------"
echo "                          [99] ==================""|""☢ Salir ☢""|""======================"
echo "                                                 -----------"
echo
read -p " [*] Elige una opcion: " opc
	case $opc in
			1 )	bash "$DIR/requisitos/1.sh"
				;;
			2 )	bash "$DIR/requisitos/2.sh"
				;;
			3 )	bash "$DIR/requisitos/3.sh"
				;;
			4 )	bash "$DIR/requisitos/4.sh"
				;;
			5 )	bash "$DIR/requisitos/5.sh"
				;;
			6 )	bash "$DIR/requisitos/6.sh"
				;;
			7 )	bash "$DIR/requisitos/7.sh"
				;;
			8 )	bash "$DIR/requisitos/8.sh"
				;;
			99 )	exit
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
				sleep 3
				bash inhibitor.sh
	esac
                                                             
