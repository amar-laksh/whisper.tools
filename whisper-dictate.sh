#!/usr/bin/env /run/current-system/sw/bin/bash

execPrefix=/run/current-system/sw/bin
localExecPrefix=/home/$USER/.nix-profile/bin
rm /tmp/whisper.text && touch /tmp/whisper.text
lastText=""
while  true ; do
    currentText=$($execPrefix/tail -n 1 /tmp/whisper.text | $execPrefix/tr -d '\n' | $execPrefix/rg -v  '\[|\(' | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')
    if [ -n "${currentText}" ] && [ "${currentText}" != "${lastText}" ]
    then
        "$localExecPrefix"/ydotool type "${currentText}"; "$execPrefix"/sleep 0.2; "$localExecPrefix"/ydotool key 28:1 28:0
        lastText=$currentText
    fi
done
