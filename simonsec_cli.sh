echo -e "\033[31m" | cat $HOME/simonsec/simonsecasciitext
echo "\033[0;31m Welcome to SimonSec 1.0"
echo "- - - - - MAIN MENU - - - -"
echo "1.NETWORKING MENU"
echo "2.APT MENU"

read -p "Choose option : " option

if [ "$option" -eq "1" ]
then
 bash $HOME/simonsec/commands_cli/networking/networking.sh
fi

if [ "$option" -eq 2 ]
then
 bash $HOME/simonsec/commands_cli/apt/apt.sh
fi
