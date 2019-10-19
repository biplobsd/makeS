#!/bin/bash

function package_init()
{
	sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install python-pip libc-ares2 libc6 libcrypto++6 libgcc1 libmediainfo0v5 libpcre3 libpcrecpp0v5 libssl1.1 libstdc++6 libzen0v5 zlib1g apt-transport-https git && sudo pip install --quiet -r https://raw.githubusercontent.com/r0oth3x49/lynda-dl/master/requirements.txt
	wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
}

function clone_pro()
{
	wget -c -nc -O megacmd.deb https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megacmd-Debian_9.0_amd64.deb
	git clone https://github.com/r0oth3x49/lynda-dl.git
}

function setup_pro()
{
	# MEGAcmd START #
	notexistF=false
	type mega-cmd
	if [ $? -eq 0 ]; then
		echo Mega-cmd is already installed.
	else
		sudo dpkg -i megacmd.deb
		# Is MEGAcmd installed!
		type mega-cmd
		if [ ! $? -eq 0 ]; then
			echo MEGA_CMD is not installed. Check for Requirements https://github.com/meganz/MEGAcmd#requirements
		fi
	fi
	# END #
	
	# Torrent CLI START #
	type torrent
	if [ $? -eq 0 ]; then
		echo torrent is already installed.
	else	
		go get github.com/anacrolix/torrent/cmd/torrent
	fi
	type webtorrent
	if [ $? -eq 0 ]; then
		echo webtorrent is already installed.
	else
		type npm
		if [ $? -eq 0 ]; then
			curl -L https://git.io/n-install | bash -s -- -y
			bash $HOME/.bashrc
		fi
		npm install webtorrent-cli -g
	fi
	# END #
}

function __start()
{
	package_init
	clone_pro
	setup_pro
}
__start
#### Change root passward START ####
sudo passwd root
now
now
echo -e "\x1B[01;91m This is your root password :\x1B[01;92m now \x1B[0m\x1B[0m"

