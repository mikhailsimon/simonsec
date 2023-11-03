prompt1=$(zenity --list --title="APT" --column="APT" "Install" "Update" "Remove" "Search" --height=300)

if [ "$prompt1" == "Install" ]
then
 packages=$(zenity --entry --title="Package Installer" --text="Enter package names separated by spaces:")
 ask_sudo=$(zenity --password --title="Sudo/Root Password" --text="Enter sudo/root password:")
 echo "Installing packages..." | echo $ask_sudo | sudo -S apt install -y $packages 2>&1 | tee /dev/null | zenity --text-info --title="Package Installer" --width=500 --height=300 --timeout=10
 zenity --info --title="Installation Completed" --text="All packages have been installed."
#else
# zenity --info --title="Installation Failed" --text="Error when installing.."
fi


if [ "$prompt1" == "Update" ]
then
 ask_sudo=$(zenity --password --title="Sudo/Root Password" --text="Enter sudo/root password:")
 echo "Installing package(s)" | echo $ask_sudo | sudo -S apt update 2>&1 | tee /dev/null | zenity --text-info --title="Package Updater" --width=500 --height=300 --timeout=10
 zenity --info --title="Update Completed" --text="Repo have been updated."
#else
# zenity --info --title="Update Failed" --text="Error when updating repos."
fi

if [ "$prompt1" == "Remove" ]
then
 packages=$(zenity --entry --title="Package Uninstaller" --text="Enter package names separated by spaces:") 
 ask_sudo=$(zenity --password --title="Sudo/Root Password" --text="Enter sudo/root password:")
 echo $ask_sudo | sudo -S apt remove -y $packages 2>&1 | tee /dev/null | zenity --text-info --title="Package Uninstaller" --width=500 --height=300 --timeout=10
 zenity --info --title="Uninstall Completed" --text="$packages have been removed."
#else
# zenity --info --title="Uninstall Failed" --text="Package uninstallation failed."
fi

if [ "$prompt1" == "Search" ]
then
 search=$(zenity --entry --title="Package Search" --text="Enter package name:")
 ask_sudo=$(zenity --password --title="Sudo/Root Password" --text="Enter sudo/root password:")
 echo $ask_sudo | sudo -S apt search $search | zenity --text-info --title="APT Search"  --width=500 --height=300
#else
# zenity --info --title="Package Search" --text="Search failed."
fi

