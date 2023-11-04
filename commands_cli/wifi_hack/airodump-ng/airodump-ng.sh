cat $HOME/simonsec/simonsecasciitext

echo "Welcome to SimonSec Airodump-ng"
echo "- - - - MAIN MENU - - - -"
echo "0.Back to SimonSec Main Menu"
echo "1.Normal"
echo "2.Normal + ESSID"
echo "3.Normal + BSSID"

option_picker() {
read -p "Choose option : " option

if [ -z "$option" ]
then
 echo "Invalid,please insert input"
 option_picker
fi

if [ "$option" -gt 6 ]
then
 echo "Please choose option in range"
 option_picker
fi

if [ "$option" -eq 0 ]
then
 echo "Going to main page"
 bash $HOME/simonsec/simonsec_cli.sh
 exit
fi

}

check_adapter() {
sudo iwconfig
}
 
wlan_set() {
read -p "Choose adapater : " wlan
if [ -z "$wlan" ]
then
 echo "Please insert input!"
 wlan_set
fi 
}
essid_num() {
read -p "Enter ESSID number : " essid
if [ -z $essid ]
then
 echo "Enter a value"
 essid_num
fi
}

bssid_num() {
read -p "Enter BSSID number : " essid
if [ -z $bssid ]
then
 echo "Enter a value"
 essid_num
fi
}


option_picker

if [ "$option" -eq 1 ]
then
 check_adapter
 wlan_set
 sudo airodump-ng $wlan
fi

if [ "$option" -eq 2 ]
then
 check_adapter
 wlan_set
 essid_num
 sudo airodump-ng --essid $essid $wlan
fi

if [ "$option" -eq 3 ]
then
 check_adapter
 wlan_set
 bssid_num
 sudo airodump-ng --bssid $bssid $wlan
fi
