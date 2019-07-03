#!/bin/bash

# chRpass () {
sudo -s
passwd --lock root
passwd -d root
sudo passwd root
now
now
# }

pgInstalling () {
	sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install libcrypto++-dev libc-ares-dev libcurl4-openssl-dev libfreeimage3 libfreeimage-dev git autoconf autogen build-essential && sudo pip install -r https://raw.githubusercontent.com/r0oth3x49/lynda-dl/master/requirements.txt
	wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
}

cloneProject () {
	git clone https://github.com/meganz/MEGAcmd.git
	git clone https://github.com/r0oth3x49/lynda-dl.git
}

setupProject () {
	# MEGAcmd START #
    cd MEGAcmd/
	git submodule update --init --recursive
    sh autogen.sh
    ./configure
    make
    sudo ldconfig
    sudo make install
    sudo ldconfig
    cd ~
	# END #
	
	# Torrent CLI START #
	go get github.com/anacrolix/torrent/cmd/torrent
	npm install webtorrent-cli -g
	# END #
}

# chRpass
# pgInstalling
# cloneProject
# setupProject
echo -e "\x1B[01;91m This is your root password :\x1B[01;92m now \x1B[0m\x1B[0m"
