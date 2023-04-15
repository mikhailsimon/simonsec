prompt1=$(zenity --list --title="Wireless Hacking" --column="Deauth Attack" "Injection Test" --width=300 --height=300)

check_adapter() {
iwconfig | zenity --text-info --title="Available Adapter List" --width=500 --height=300
}

if [ "$prompt1" == "Injection Test" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
  if [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 gnome-terminal -- sudo aireplay-ng -9 $wlan
fi
