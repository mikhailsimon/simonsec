prompt1=$(zenity --list --title="Diagnostics" --column="Diagnostics" "Print Computer Info" --height=300)

if [ "$prompt1" == "Print Computer Info" ]
then
 result_pc_check=$(echo "CPU:" && lscpu | grep "Model name" && echo "GPU:" && lspci | grep -i vga && echo "RAM:" && free -h | grep Mem && echo "Storage:" && df -h | grep "/dev/" && echo "Username and hostname:" && echo "$USER@$HOSTNAME" && echo "IP address:" && hostname -I)
 zenity --text-info --title="PC Check" --width=800 --height=600 --filename=/dev/stdin <<<"$result_pc_check"
fi
