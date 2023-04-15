prompt1=$(zenity --list --title="Wireless Hacking" --column="Wireless Hacking" "See All Available Adapter" "Enable Monitor Mode" "Set Channel" "Airodump-ng" "Deauth Attack" "Beacon Flooding" --width=300 --height=300)

check_adapter() {
iwconfig | zenity --text-info --title="Available Adapter List" --width=500 --height=300
}

wlan_set() {
wlan=$(zenity --entry --title="Card Interface" --text="Interface:" --width=300)
 if [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
 fi
 if [[ "$?" -eq 1 ]]; then
    exit 1
 fi
}
channel_set() {
channel=$(zenity --entry --title="Channel Set" --text="Channel:")
 if [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit
 fi
}

if [ "$prompt1" == "See All Available Adapter" ]
then
 check_adapter
fi

if [ "$prompt1" == "Enable Monitor Mode" ]
then
 sudo airmon-ng | zenity --text-info --title="Available Adapter List" --width=500 --height=300
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
  if [ -z "$wlan" ]; then
    zenity --error --title="Error" --text="No interface selected"
    exit 1
  fi
 sudo airmon-ng start $wlan
   if [ $? -eq 0 ]; then
    zenity --info --title="Monitor Mode" --text="Successfully set to Monitor Mode"
   fi
fi

if [ "$prompt1" == "Set Channel" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 channel=$(zenity --entry --title="Channel Set" --text="Channel:")
  if [ -z "$wlan" ] || [ -z "$channel" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 sudo iwconfig $wlan channel $channel
  if [ $? -eq 0 ]; then
    zenity --info --title="Channel Set" --text="$wlan have been set to $channel"
  fi
fi

if [ "$prompt1" == "Airodump-ng" ]
then
 cd ~/simonsec/commands/wirelesshack/airodump-ng
 bash airodump-ng.sh
fi

if [ "$prompt1" == "Deauth Attack" ]
then
 cd ~/simonsec/commands/wirelesshack/deauth
 bash deauth.sh
fi

if [ "$prompt1" == "Beacon Flooding" ]
then
 check_adapter
 wlan=$(ip -o link show | awk -F': ' '{print $2}' | zenity --list --title="Network Interfaces" --column="Interface Name")
 gnome-terminal -- sudo mdk3 $wlan b | zenity --info --title="MDK3" --text="Beacon Flooding Started" --width=300
fi
