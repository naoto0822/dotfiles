#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)
. "$CURRENT_PATH"/logger.sh

dotfiles='

      _           _      __   _   _
   __| |   ___   | |_   / _| (_) | |   ___   ___
  / _` |  / _ \  | __| | |_  | | | |  / _ \ / __|
 | (_| | | (_) | | |_  |  _| | | | | |  __/ \__ \
  \__,_|  \___/   \__| |_|   |_| |_|  \___| |___/

'

info_log "$dotfiles"
