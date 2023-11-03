prompt1=$(zenity --list --title="Networking" --column="Networking" "Bypass Internet TTL" "Local IP Address" "Track IP Address" "SSH to Server" "NMAP Search" --height=300)

if [ "$prompt1" == "Bypass Internet TTL" ]
then
 sudo sysctl -w net.ipv6.conf.default.hop_limit=65
 sudo sysctl -w net.ipv4.ip_default_ttl=65
 zenity --info --title="TTL Bypasser" --text="TTL BYPASSED SUCCESSFULLY!"
fi

if [ "$prompt1" == "Local IP Address" ]
then
 ip_local_result=$(ifconfig)
 zenity --text-info --title="Local IP Address" --width=500 --height=500 --filename=/dev/stdin <<<"$ip_local_result"
fi

if [ "$prompt1" == "NMAP Search" ]
then
 address=$(zenity --entry --title="NMAP Search" --text="IP Address/Domain:")
 ask_sudo=$(zenity --password --title="Sudo/Root Password" --text="Enter sudo/root password:")
 echo "Searching targets info..."| echo $ask_sudo | sudo -S nmap -v -O $address 2>&1 | tee /dev/null | zenity --text-info --title="NMAP Search" --width=500 --height=300 
fi

if [ "$prompt1" == "Track IP Address" ]
then
 ip_search=$(zenity --entry --title="IP Tracker" --text="IP Address:")
 curl http://ip-api.com/xml/$ip_search?fields=33292287 | zenity --text-info --title="IP Tracker" --width=500 --height=300
fi

if [ "$prompt1" == "SSH to Server" ]
then
 ip=$(zenity --entry --title="SSH to Server" --text="IP Address or Domain:")
 username=$(zenity --entry --title="SSH to Server" --text="Username":)
 password=$(zenity --password --title="$username Password")
 gnome-terminal -- sshpass -p '$password' ssh $username@$ip
fi

