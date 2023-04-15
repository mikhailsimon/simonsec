prompt1=$(zenity --list --title="APT" --column="APT" "Install" "Update" "Remove" "Search" --height=300)

if [ "$prompt1" == "Install" ]
then
 packages=$(zenity --entry --title="Package Installer" --text="Enter package names separated by spaces:")
 echo "Installing packages..." | sudo apt install -y $packages 2>&1 | tee /dev/null | zenity --text-info --title="Package Installer" --width=500 --height=300 --timeout=10
 zenity --info --title="Installation Completed" --text="All packages have been installed."
fi


if [ "$prompt1" == "Update" ]
then
 echo "Installing package(s)" | sudo apt update 2>&1 | tee /dev/null | zenity --text-info --title="Package Updater" --width=500 --height=300 --timeout=10
 zenity --info --title="Update Completed" --text="Repo have been updated."
fi

if [ "$prompt1" == "Remove" ]
then
 packages=$(zenity --entry --title="Package Uninstaller" --text="Enter package names separated by spaces:") 
 sudo apt remove -y $packages 2>&1 | tee /dev/null | zenity --text-info --title="Package Uninstaller" --width=500 --height=300 --timeout=10
 zenity --info --title="Uninstall Completed" --text="$packages have been removed."
fi

if [ "$prompt1" == "Search" ]
then
 search=$(zenity --entry --title="Package Uninstaller" --text="Enter package name:")
 sudo apt search $search | zenity --text-info --title="APT Search"  --width=500 --height=300
fi

