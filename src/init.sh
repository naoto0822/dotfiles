#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/os.sh
. "$CURRENT_PATH"/logger.sh

info_log "*****************************************"
info_log "---> Starting install."
info_log "*****************************************"

if is_mac_os; then
  sh "$CURRENT_PATH"/mac_os.sh
elif is_linux; then
  sh "$CURRENT_PATH"/linux.sh
else
  error_log "unsupported env"
  exit 1
fi

info_log "---> common script"
sh "$CURRENT_PATH"/common.sh
