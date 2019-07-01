#!/bin/bash
    sudo -s
    passwd --lock root
    passwd -d root
    sudo passwd root
now
now
    sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install libcrypto++-dev libc-ares-dev libcurl4-openssl-dev libfreeimage3 libfreeimage-dev git autoconf autogen && sudo pip install -r https://raw.githubusercontent.com/r0oth3x49/lynda-dl/master/requirements.txt
	git clone https://github.com/meganz/MEGAcmd.git
    git clone https://github.com/r0oth3x49/lynda-dl.git
    cd MEGAcmd/
    sh autogen.sh
    ./configure
    make
    sudo ldconfig
    sudo make install
    sudo ldconfig
    cd ~
	go get github.com/anacrolix/torrent/cmd/torrent
    echo -e "\x1B[01;91m This is your root password :\x1B[01;92m now \x1B[0m\x1B[0m"
