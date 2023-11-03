echo -e "\033[31m" | cat $HOME/simonsec/simonsecasciitext
echo "\033[0;31m Welcome to SimonSec 1.1"
echo "- - - - - MAIN MENU - - - -"
echo "0.Exit SimonSec"
echo "1.NETWORKING MENU"
echo "2.APT MENU"
echo "3.WIFI HACKING"

option_picker() {
read -p "Choose option : " option

if [ -z "$option" ]
then
 echo "Invalid,please insert input"
 option_picker
fi

if [ "$option" -gt 3 ]
then
 echo "Please choose option in range"
 option_picker
fi

if [ "$option" -eq 0 ]
then
 echo "Goodbye!"
 exit
fi

#if [ -n "$option" ]
#then
# echo "Invalid,numbers only"
# option_picker
#fi
}

option_picker

if [ "$option" -eq 1 ]
then
 bash $HOME/simonsec/commands_cli/networking/networking.sh
fi

if [ "$option" -eq 2 ]
then
 bash $HOME/simonsec/commands_cli/apt/apt.sh
fi

if [ "$option" -eq 3 ]
then
 bash $HOME/simonsec/commands_cli/wifi_hack/wifi_hack.sh
fi
