#!/bin/sh

# install ricty for macOS
if [ `which brew` ]; then
  brew tap sanemat/font
  brew install ricty
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
fi
