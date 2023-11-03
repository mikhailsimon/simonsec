cat $HOME/simonsec/simonsecasciitext

exit_prog() {
read -p "Press any key to exit"
}

echo "Welcome to SimonSec Networking"

echo "- - - - MENU - - - -"
echo "1.Local IP Check"
echo "2.Bypass Internet TTL"
echo "3.Track IP Address"
echo "4.SSH to Server"
echo "5.NMAP Search"

read -p "Choose option : " option

if [ "$option" -eq 1 ]
then
 sudo ifconfig
fi

if [ "$option" -eq 2 ]
then
 sudo sysctl -w net.ipv6.conf.default.hop_limit=65
 sudo sysctl -w net.ipv4.ip_default_ttl=65
 echo "TTL bypassed."
fi

if [ "$option" -eq 3 ]
then
 read -p "Insert Domain or IP Address : " ip_search
 curl http://ip-api.com/xml/$ip_search?fields=33292287
fi

if [ "$option" -eq 4 ]
then
 read -p "IP/Domain : " ip_ssh
 read -p "Username : " user
 read -p "Password : " pass
 sshpass -p "$pass" ssh $user@$ip_ssh
fi

if [ "$option" -eq 5 ]
then
 read -p "IP/Domain : " ip_search
 sudo nmap -v -O $ip_search
fi



exit_prog
