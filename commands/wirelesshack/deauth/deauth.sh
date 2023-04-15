prompt1=$(zenity --list --title="Wireless Hacking" --column="Deauth Attack" "Injection Test" --width=300 --height=300)

check_adapter() {
iwconfig | zenity --text-info --title="Available Adapter List" --width=500 --height=300
}

if [ "$prompt1" == "Deauth Attack" ]
then
 check_adapter
 wlan=$(zenity --entry --title="Card Interface" --text="Interface:" --width=300)
  if [ -z "$wlan" ]
   then
     zenity --info --title="Error" --text="Please insert input"
     exit 1
  fi
 gnome-terminal -- sudo aireplay-ng -9 $wlan
fi
