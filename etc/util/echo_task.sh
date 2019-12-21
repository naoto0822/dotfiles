#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

echo_task () {
  info_log "##########################"
  info_log "# ${BOLD}$1${NORMAL}"
  info_log "##########################"
}

echo_command () {
  info_log ""
  info_log "${BOLD}running $1...${NORMAL}"
  info_log ""
}

echo_empty () {
  echo ""
}
