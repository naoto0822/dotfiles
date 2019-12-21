#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

info_log "---> install Ricty font"
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
