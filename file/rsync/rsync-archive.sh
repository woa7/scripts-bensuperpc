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
#//  Script, 2020                                            //
#//  Created: 21, November, 2020                             //
#//  Modified: 03, August, 2021                              //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if (( $# == 2 )); then
    LOG_DATE=$(date +%Y-%m-%d_%H_%M_%S)

    rsync --progress --stats --archive --xattrs --acls --dry-run \
        --delete-during --human-readable --partial "$1" "$2"

    echo
    echo "Warning! In '$2' some files will be deleted."
    read -p "Are you sure ? [Y/n]" -n 1 -r
    echo

    if [[ $REPLY =~ ^[Y]$ ]]; then
        echo "Sync in 5 seconds..."
        sleep 5
        rsync --progress --stats --archive --acls --partial \
            --delete-during --human-readable --xattrs \
            --log-file=log_rsync_"$LOG_DATE".log "$1" "$2"
    else
        echo "No sync"
    fi
else
    echo "Usage: ${0##*/} <source> <destination>"
    exit 1
fi
