VPN=$(ifconfig | grep utun4)

if [[ $VPN != "" ]]; then
		sketchybar -m --set vpn label=" "
else
		sketchybar -m --set vpn label=" "
fi
