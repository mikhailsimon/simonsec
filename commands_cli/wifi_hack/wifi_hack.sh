cat $HOME/simonsec/simonsecasciitext

echo "Welcome to SimonSec WiFi Hacking"
echo "0.Back to SimonSec Main Page"
echo "1.See All Available Adapters"
echo "2.Enable Monitor Mode"
echo "3.Set Channel"
echo "4.Airodump-ng"
echo "5.Deauth Attack"
echo "6.Beacon Flooding"
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

#if [ -n "$option" ]
#then
# echo "Invalid,numbers only"
# option_picker
#fi
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

channel_set() {
read -p "Channel set : " channel
if [ -z wlan ]
then
 echo "Please insert input"
 channel_set
fi
}

option_picker

if [ "$option" -eq 1 ]
then
 check_adapter 
fi

if [ "$option" -eq 2 ]
then
 sudo airmon-ng
 wlan_set
 sudo airmon-ng start $wlan
fi

if [ "$option" -eq 3 ]
then
 check_adapter
 wlan_set
 channel_set
 sudo iwconfig $wlan channel $channel
fi
 if [ "$option" -eq 4 ]
then
 echo "Loading Airodump-ng section"
 bash $HOME/simonsec/commands_cli/wifi_hack/airodump-ng/airodump-ng.sh
fi

if [ "$option" -eq 5 ]
then
 echo "Loading Deauth menu...."
 bash $HOME/simonsec/commands_cli/wifi_hack/deauth/deauth.sh
fi

if [ "$option" -eq 6 ]
then
 check_adapter
 wlan_set
 echo "Starting beacon flooding attack"
 sudo mdk3 $wlan b
fi
