#!/bin/sh

# mac or linux or cygwin
export OS

get_os() {
  if [ "$(uname)" == "Darwin" ]; then
    OS="mac"
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS="linux"
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS="cygwin"
  else
    echo "[WARN] unsupport os."
    exit 1
  fi
}

is_macos() {
  get_os
  if [ "$OS" == "mac" ]; then
    echo "true"
  else
    echo "false"
  fi
}

is_linux() {
  get_os
  if [ "$OS" == "linux" ]; then
    echo "true"
  else
    echo "false"
  fi
}

is_cygwin() {
  get_os
  if [ "$OS" == "cygwin" ]; then
    echo "true"
  else
    echo "false"
  fi
}

