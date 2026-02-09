#!/bin/bash
#Interface Setup
echo "Go to interface options and Turn on SPI"
echo "Go to boot options and choose auto login (Option 2)"
echo "Do not reboot"
sleep 5
sudo raspi-config

#Environment Setup
sudo apt update
sudo apt upgrade -y
sudo apt-get install xorg -y
echo "comment out:
	 dtoverlay=vc4-kms-v3d
	max_framebuffers=2"
sleep 5
sudo nano /boot/config.txt

#Part 2 setup
wget http://192.168.1.248:8000/installScreen2.sh
chmod +x installScreen2.sh
echo './installScreen2.sh' | sudo tee -a .bash_profile

#Reboot
echo "Pi will reboot now"
sleep 5
reboot
