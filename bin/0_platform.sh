#!/bin/bash

source "$DOTPATH"/bin/util/logger.sh

case "$(uname)" in
Darwin*)
  for file in $(echo "$DOTPATH/bin/osx/*.sh"); do
    info_log "---> running $file"
    bash $file
  done
  ;;
# Linux*)
  # for file in "$DOTPATH/bin/linux/*.sh"; do
    # bash $file
  # done
  # ;;
esac

