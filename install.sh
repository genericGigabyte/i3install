#xorg
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

#basic essentials
sudo apt install -y build-essential

#intel microcode
sudo apt install -y intel-microcode
#AMD microcode
#sudo apt install -y amd64-microcode

#network manager
#change managed to true in /etc/NetworkManager/NetworkManager.conf
#after desktop install follow the switching to IWD guide on debian.org
sudo apt install -y network-manager network-manager-gnome gnome-control-center

#appearance management
sudo apt install -y lxappearance

#file manager
sudo apt install -y thunar thunar-archive-plugin xfce4-settings xfce4-power-manager xfce4-terminal  policykit-1-gnome
#the other terminal
sudo apt install -y kitty

#network file tools/system events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

#sound packages
#add the execution on startup script: exec --no-startup-id i3-msg 'exec /usr/bin/pulseaudio --start'
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

#neofetch/htop
sudo apt install -y neofetch htop

#curl and brave
sudo apt install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

#desktop background browser/handler
sudo apt install -y nitrogen

#install i3 window manager
sudo apt install -y i3-wm

#printing and bluetooth
sudo apt install -y cups system-config-printer simple-scan
sudo apt install -y bluez blueman

sudo systemctl enable cups
sudo systemctl enable bluetooth

#intall extra packages I need
#run timeshift by executing sudo timeshift-gtk
#dunst config: ~/.Confing/dunst/dunstrc
sudo apt install -y rofi drun dunst libnotify-bin unzip simple-scan libreoffice libreoffice-gtk3 vcl shotwell flameshot timeshift zathura picom

#install exa
#.baschrc, change: alias ls='exa --grid --colour=always --icons'
sudo apt install -y exa

#install spotify
curl -sS --insecure https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client

#install fonts
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus
#don't forget nerd fonts jetbrains mono

#lightdm
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

sudo apt autoremove

#apply dot files

#dunst
cd /home/zach/.config/dunst
sudo rm -r dunstrc
cd /home/zach/i3install/dunst
sudo mv dunstrc /home/zach/.config/dunst

#i3
cd /home/zach/.config/i3
sudo rm -r config
cd /home/zach/i3install/i3
sudo mv config /home/zach/.config/i3

#i3blocks
cd
git clone https://github.com/Airblader/i3blocks-gaps.git
make clean all
sudo make install
cd /home/zach/.config/
sudo mkdir i3blocks
cd i3blocks
git clone https://github.com/vivien/i3blocks-contrib.git
sudo mv i3blocks-contrib/ scripts
cd /home/zach/i3install/
sudo mv config /home/zach/.config/i3blocks

#kitty
cd /home/zach/.config/kitty
sudo rm -r kitty.conf
cd /home/zach/i3install/kitty
sudo mv kitty.conf /home/zach/.config/kitty

#rofi
cd /home/zach/.config/rofi
sudo rm -r config.rasi
cd /home/zach/i3install/rofi
sudo mv config.rasi /home/zach/.config/rofi

printf "You can reboot now!"
