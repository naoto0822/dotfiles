#!/bin/bash

source "$DOTPATH"/bin/util/logger.sh

info_log "---> install Ricty font"
brew tap sanemat/font
brew install ricty
cp -f /opt/homebrew/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
