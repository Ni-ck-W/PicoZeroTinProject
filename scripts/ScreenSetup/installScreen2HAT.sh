#!/bin/bash

#Building Program
cd
sudo apt-get install cmake -y
sudo apt-get install p7zip-full -y
wget https://files.waveshare.com/upload/f/f9/Waveshare_fbcp.7z
7z x Waveshare_fbcp.7z -o./waveshare_fbcp
cd waveshare_fbcp
mkdir build
cd build
cmake -DSPI_BUS_CLOCK_DIVISOR=20 -DWAVESHARE_1INCH3_LCD_HAT=ON -DBACKLIGHT_CONTROL=ON -DSTATISTICS=0 ..
make -j

#Auto Start Setup
sudo cp ~/waveshare_fbcp/build/fbcp /usr/local/bin/fbcp
echo "Add fbcp& before exit 0"
sleep 5
sudo nano /etc/rc.local

# Display Setup
echo "hdmi_force_hotplug=1" | sudo tee -a /boot/config.txt
echo "hdmi_cvt=300 300 60 1 0 0 0" | sudo tee -a /boot/config.txt
echo "hdmi_group=2" | sudo tee -a /boot/config.txt
echo "hdmi_mode=87" | sudo tee -a /boot/config.txt
echo "display_rotate=0" | sudo tee -a /boot/config.txt

# Button Setup
echo '# ======== GPIO KEYS SETUP ========' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=6,   active_low=1,gpio_pull=up,keycode=103,label="JoyUp"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=19,  active_low=1,gpio_pull=up,keycode=108,label="JoyDown"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=5,   active_low=1,gpio_pull=up,keycode=105,label="JoyLeft"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=26,  active_low=1,gpio_pull=up,keycode=106,label="JoyRight"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=13,  active_low=1,gpio_pull=up,keycode=57,label="JoyPress"   # SPACE' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=21,  active_low=1,gpio_pull=up,keycode=28,label="Key1_Enter"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=20,  active_low=1,gpio_pull=up,keycode=45,label="Key2_X"' | sudo tee -a /boot/config.txt
echo 'dtoverlay=gpio-key,gpio=16,  active_low=1,gpio_pull=up,keycode=46,label="Key3_C"' | sudo tee -a /boot/config.txt
echo '# =================================' | sudo tee -a /boot/config.txt

#Removing install files
cd
rm Waveshare_fbcp.7z
rm -rf waveshare_fbcp
rm installScreen1.sh
rm installScreen2.sh
sudo rm .bash_profile

#Apply Changes
sudo reboot
