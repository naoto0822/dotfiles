#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/os.sh
. "$CURRENT_PATH"/logger.sh

info_log "-----------------------------------------"
info_log "---> start install"
info_log "-----------------------------------------"

if is_macos; then
  sh "$CURRENT_PATH"/mac.sh
elif is_linux; then
  sh "$CURRENT_PATH"/linux.sh
else
  error_log "[ERROR] unsupported env"
fi

info_log "[INFO] For common script"

sh "$CURRENT_PATH"/common.sh

info_log "******************************************"
info_log "Installed Successfully My Dotfiles :tada: "
info_log "******************************************"
