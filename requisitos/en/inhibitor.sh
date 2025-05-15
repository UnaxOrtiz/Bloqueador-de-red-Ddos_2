#!bin/bash

source installer.sh

Title
echo "                          ========================================================"
echo "                                                  Utilities"
echo "                          ========================================================"
echo "                          [1] Status Network Card"
echo "                          [2] Advanced scanner Wifi networks"
echo "                          [3] Scan devices connected to a third party Wifi"
echo "                          ========================================================"
echo "                                             Attacks Network/Lan"
echo "                          ========================================================"
echo "                          [4] Incommunicate to a Device/IP"
echo "                          [5] Slow down the Router data flow"
echo "                          ========================================================"
echo "                                       Attacks on External Wifi Networks"
echo "                          ========================================================"
echo "                          [6] Disconnecting a device from a Wifi Network"
echo "                          [7] Disconnecting all devices from a Wifi Network"
echo "                          [8] Disconnect all Wifi Networks from a Channel"
echo "                                                 ----------"
echo "                          [99] ==================""|""☢ Exit ☢""|""======================="
echo "                                                 ----------"
echo
read -p " [*] Choose one option: " opc
	case $opc in
			1 )	bash requisitos/1.sh
				;;
			2 )	bash requisitos/2.sh
				;;
			3 )	bash requisitos/3.sh
				;;
			4 )	bash requisitos/4.sh
				;;
			5 )	bash requisitos/5.sh
				;;
			6 )	bash requisitos/6.sh
				;;
			7 )	bash requisitos/7.sh
				;;
			8 )	bash requisitos/8.sh
				;;
			99 )	exit
				;;
			* )	echo
				echo "$RRPLY It is not a valid option"
				sleep 3
				bash inhibitor.sh
	esac
                                                             
