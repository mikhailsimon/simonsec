cat $HOME/simonsec/simonsecasciitext

exit_prog() {
read -p "Press any key to exit...."
}

ask_program() {
read -p "Enter program name : " program_name
}
echo "- - - - APT MENU - - - -"
echo "0.Back to SimonSec Main Page"
echo "1.Update"
echo "2.Install"
echo "3.Remove"
echo "4.Search"

option_picker() {
read -p "Choose option : " option

if [ -z "$option" ]
then
 echo "Invalid,please insert input"
 option_picker
fi

if [ "$option" -gt 4 ]
then
 echo "Please choose option in range"
 option_picker
fi

if [ "$option" -eq 0 ]
then
 echo "Going to main page"
 bash $HOME/simonsec/simonsec_cli.sh
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
 sudo apt update
 exit_prog

fi

if [ "$option" -eq 2 ]
then
 ask_program
 sudo apt install $program_name
fi

if [ "$option" -eq 3 ]
then
 ask_program
 sudo apt remove $program_name
fi
