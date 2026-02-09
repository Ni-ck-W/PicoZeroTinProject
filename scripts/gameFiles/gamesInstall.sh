#Games and Menu Setup
#Can replace the wget however you want to get files onto your system
#I have a python server running with the needed files in the dir

#Menu System
cd
wget http://192.168.1.248:8000/bootMenu.sh
chmod +x bootMenu.sh
echo './bootMenu.sh' | sudo tee -a .bash_profile


#Pico-8
cd
wget http://192.168.1.248:8000/pico.zip
unzip pico
rm pico.zip

#Doom
cd
sudo apt-get install chocolate-doom -y
wget http://192.168.1.248:8000/chocolate-doom.cfg
wget http://192.168.1.248:8000/default.cfg
wget http://192.168.1.248:8000/DOOM.WAD
wget http://192.168.1.248:8000/DOOM2.WAD
wget http://192.168.1.248:8000/doom1.sh
sudo mv chocolate-doom.cfg .local/share/chocolate-doom/
sudo mv default.cfg .local/share/chocolate-doom/
sudo mv DOOM.WAD /usr/share/games/doom/
sudo mv DOOM2.WAD /usr/share/games/doom/
sudo chmod +x doom1.sh

#RetroArch
cd
mkdir roms
mkdir roms/gb roms/gbc roms/nes
sudo apt-get install retroarch -y
sudo apt-get install libretro-* -y
wget http://192.168.1.248:8000/retroarch.cfg
sudo mv retroarch.cfg .config/retroarch/

#sm64
cd
sudo apt install build-essential git python3 libaudiofile-dev libglew-dev libglfw3-dev libsdl2-dev -y
sudo apt-get install libusb-1.0.0 -y
git clone https://github.com/sm64pc/sm64pc
wget http://192.168.1.248:8000/sm64.z64
wget http://192.168.1.248:8000/sm64.sh
wget http://192.168.1.248:8000/sm64config.txt
chmod +x sm64.sh
cp sm64.z64 sm64pc/baserom.us.z64
cd sm64pc
make VERSION=us TARGET_RPI=1 -j4
cd
sudo mv sm64config.txt .local/share/sm64ex/


#Apply Changes
sudo reboot
