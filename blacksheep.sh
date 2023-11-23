#!/usr/bin/bash
i=0
airmon-ng start wlan0
airmon-ng check kill
echo -n "enter wifi name: "
read w_name
echo "enter amount"
read amount
while [ $i -lt $amount ]
do
	echo "$w_name $i" >> wifi.lst
	i=$((i + 1))
done
echo "file created successfully: "
sleep 0.5
echo "start mdk4 now: "
echo
sudo mdk4 wlan0mon b -c 1 -f wifi.1st -s 500 -w at
echo "---------------------------------------------------"
echo -e "do you want to delete the wifi list: \n1: YES\n2: No"
read choice
case $choice in
     1)
        Im wifi.1st
        echo "file removed successfully: "
     2)
        echo "file saved: "
     *)
        echo "invalid input: "
esac
airmon-ng stop wlan0mon
systemctl restart NetworkManager
