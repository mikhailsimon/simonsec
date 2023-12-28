prompt1=$(zenity --list --title="Wireless Hacking" --column="Airodump-ng" "Normal" "Normal + ESSID" "Normal + BSSID" --width=300 --height=300)

close() {
read -p "Press Enter to close...."
}

check_adapter() {
iwconfig | zenity --text-info --title="Available Adapter List" --width=500 --height=300
}

if [ "$prompt1" == "Normal" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
  if [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 qterminal -e sudo airodump-ng $wlan
fi

if [ "$prompt1" == "Normal + ESSID" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 essid=$(zenity --entry --title="ESSID" --text="ESSID:" --width=300)
  if [ -z "$wlan" ] | [ -z "$essid" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 qterminal -e sudo airodump-ng --essid $essid $wlan
fi

if [ "$prompt1" == "Normal + BSSID" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 bssid=$(zenity --entry --title="BSSID" --text="BSSID:" --width=300)
  if [ -z "$wlan" ] | [ -z "$bssid" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 qterminal -e sudo airodump-ng --bssid $bssid $wlan
fi
