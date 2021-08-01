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
#//  Created: 29, July, 2021                                 //
#//  Modified: 01, August, 2021                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if (( $# == 3 )); then
    Var1="$1"
    Var2="$2"
    Var3="$3"
    find . -type f \( -name "*.$Var3" -o -name "*.$Var3" \) -print0 | xargs -0 -P"$(nproc)" -I{} sed -i "s|$Var1|$Var2|g" "{}"
else
    echo "Usage: ${0##*/} <STR1> <STR2> <Extension (wihout point)>"
    exit 1
fi
