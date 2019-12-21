#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

case "$(uname)" in
Darwin*)
  for file in "$DOTPATH/etc/osx/*.sh"; do
    bash $file
  done
  ;;
# Linux*)
  # for file in "$DOTPATH/etc/linux/*.sh"; do
    # bash $file
  # done
  # ;;
esac

