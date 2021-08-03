#!/usr/bin/env bash
set -euo pipefail
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 24, July, 2021                                 //
#//  Modified: 29, July, 2021                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if [[ "$EUID" = 0 ]]; then
    echo "(1) already root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "(2) correct password"
    else
        echo "(3) wrong password"
        exit 1
    fi
fi

#journalctl --disk-usage
sudo journalctl --vacuum-time=3d
echo "Clear journalctl: OK"

#du -h /var/lib/snapd/snaps
sudo find ~/.cache/ -type f -atime +3 -delete
echo "Clear cache: OK"

sudo find ~/Téléchargements/ -type f -atime +15 -delete || true
sudo find ~/Downloads/ -type f -atime +15 -delete || true
echo "Clear Downloads: OK"

sudo rm -rf ~/.local/share/Trash/*
echo "Clear Trash: OK"

sudo docker image prune -f || true
echo "Clear docker: OK"

echo "Clean: OK"
