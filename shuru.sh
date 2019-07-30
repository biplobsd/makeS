#!/bin/bash

function package_init()
{
	sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install libcrypto++-dev libc-ares-dev libcurl4-openssl-dev libfreeimage3 libfreeimage-dev git autoconf autogen build-essential && sudo pip install --quiet -r https://raw.githubusercontent.com/r0oth3x49/lynda-dl/master/requirements.txt
	wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
}

function clone_pro()
{
	git clone https://github.com/meganz/MEGAcmd.git
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
		cd MEGAcmd/
		isfileX=( mega-cmd mega-cmd-server mega-exec )
		for i in "${isfileX[@]}"
		do
			if [[ ! -f "$i" ]]; then
				echo "$i not exist."
				notexistF=true
			fi
		done
		if $notexistF ; then
			git submodule update --init --recursive
			sh autogen.sh
			./configure
			make
			sudo ldconfig
		fi
		sudo make install
		sudo ldconfig
		cd ~
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
			.$HOME/.bashrc
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
#sudo -s
#passwd --lock root
#passwd -d root
sudo passwd root
now
now
# if [ $? -eq 0 ]; then
# 	echo OK
# else
# 	sudo passwd --lock root
# 	sudo passwd -d root
# 	sudo passwd root
# 	now
# 	now
# fi
# END #
echo -e "\x1B[01;91m This is your root password :\x1B[01;92m now \x1B[0m\x1B[0m"

