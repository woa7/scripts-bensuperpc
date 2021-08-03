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
#//  Created: 20, December, 2020                             //
#//  Modified: 24, july, 2021                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if (( $# == 1 )); then
    filename=$1
    fname_input="$filename/*"
    fname_output="$filename-$(date +"%Y-%m-%dT%H-%M-%S").7z"

    #7z Options
    algo="-m0=lzma2"
    compresslevel="-mx=9"
    threading="-mmt"

    time 7z a "$fname_output" "$fname_input" "$algo" "$compresslevel" -aoa "$threading"
else
    echo "Usage: ${0##*/} <file>"
    exit 1
fi
