#!/bin/sh

COLOR_RED="\e[31m"
COLOR_YELLOW="\e[32m"
COLOR_BLUE="\e[34m"
COLOR="\e[37m"
COLOR_END="\e[m"
LINE="\n"

timestamp() {
  printf "$(date +'%Y/%m/%d %H:%M:%S')"
}

info_log() {
  printf "${COLOR_BLUE}[$(timestamp)] [INFO] $1${COLOR_END}${LINE}";
}

warn_log() {
  printf "${COLOR_YELLOW}[$(timestamp)] [WARN] $1${COLOR_END}${LINE}";
}

error_log() {
  printf "${COLOR_RED}[$(timestamp)] [ERROR] $1${COLOR_END}${LINE}";
}

