#!/bin/bash

function package_in()
{
	command sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install libcrypto++-dev libc-ares-dev libcurl4-openssl-dev libfreeimage3 libfreeimage-dev git autoconf autogen build-essential && sudo pip install -r https://raw.githubusercontent.com/r0oth3x49/lynda-dl/master/requirements.txt
	command wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
}

function clone_pro()
{
	git clone https://github.com/meganz/MEGAcmd.git
	git clone https://github.com/r0oth3x49/lynda-dl.git
}

function setup_pro()
{
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

function __start()
{
	package_in
	clone_pro
	setup_pro
	## Change root passward START ##
	#sudo -s
	#passwd --lock root
	#passwd -d root
	sudo passwd root
	now
	now
	if [ $? -eq 0 ]; then
    	echo OK
	else
		sudo passwd --lock root
		sudo passwd -d root
		sudo passwd root
		now
		now
	fi
	# END #
	echo -e "\x1B[01;91m This is your root password :\x1B[01;92m now \x1B[0m\x1B[0m"
}
__start

