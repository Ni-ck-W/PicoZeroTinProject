# PicoZeroTinProject
This projects goal was to build a portable pico-8 device in a Nintendo Gameboy candy tin. After building it I expanded it with other games, like doom lol, but those can be removed pretty easily. This was a home project made for fun by a complete novice, so the work is scuff but working. I'm sure many can do it much better, but it was fun to build.

## Hardware used
Raspberry Pi Zero W 2
PiSugar S
Waveshare 1.3inch LCD
micro-sd card
Some wires and buttons

## Main Software Used
2023-05-03-raspios-bullseye-armhf-lite
  - https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-05-03/2023-05-03-raspios-bullseye-armhf-lite.img.xz
Screen Driver
  - https://files.waveshare.com/upload/f/f9/Waveshare_fbcp.7z
xorg

## Game Software Used
pico-8
chocolate-doom
retroarch
build-essential 
git 
python3 
libaudiofile-dev 
libglew-dev 
libglfw3-dev 
libsdl2-dev 
libusb-1.0.0

## Games Preconfigured
Pico-8
Doom 1 & 2
RetroArch
SM64

## Scripts
installScreen1.sh & installScreen2.sh
  - Guided install scripts to setting up the screen to work with the pi.
  - Device will need to reboot twice during setup
  - Only need to run installScreen1.sh as it will run the second one when needed
bootMenu.sh
  - Custom Terminal Menu for launching games
  - Setup to run on boot if gamesInstall.sh was used
gamesInstall.sh
  - Games and Menu Setup
doom1.sh
  - Scripted used to boot doom 1 instead of 2
sm64.sh
  - Scripted used to boot sm64


## Files Needed Outside of this Repo
If you run the install scripts they get all the fills from a python server with the needed files in home directory. No copyrighted or paid content is included here, so go get it yourself.
Pico-8
  - https://www.lexaloffle.com/pico-8.php
  - Download the Raspberry Pi version and rename to pico.zip
Doom 1 & 2
  - DOOM.WAD and DOOM2.WAD
RetroArch
  - No roms are auto added, but a file structure is made for gb, gbc, and nes
  - roms/gb roms/gbc roms/nes
SM64
  - This scripted builds the decomp of sm64 to run directly on the pi instead of an emulator. This means you need to provide your sm64 dump named sm64.z64
  - The configs at of writing are not 100% complete, so you will need to shutdown your pi to exit.

## Screen Setup
NOTE: 
This will guide threw how I setup the device, but there is lots of room to do it other ways. Also the Waveshare 1.3inch LCD Hat works with the screen setup, so you can use that before committing to soldering the regular screen.
1. Flash 2023-05-03-raspios-bullseye-armhf-lite onto a micro-sd card with Raspberry Pi Imager and customize user settings for connecting to wifi
2. Connect either the HAT or solder the screen according to their image [here](https://www.waveshare.com/w/upload/thumb/c/cb/1.3-rpi.jpg/800px-1.3-rpi.jpg)
3. Copy installScreen1.sh & installScreen2.sh to the device *I like doing this with wget and python server who could've guessed*.
4. Run the installScreen1.sh script and follow the instructions when told.
5. Profit aka the screen should work now and buttons if you soldered some or are using the HAT
  - We will get to soldering buttons in the button setup section

