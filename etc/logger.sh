#!/bin/sh

COLOR_RED="\e[31m"
COLOR_YELLOW="\e[32m"
COLOR_BLUE="\e[34m"
COLOR="\e[37m"
COLOR_END="\e[m"
LINE="\n"

info_log() {
  printf "${COLOR_BLUE}$1${COLOR_END}${LINE}";
}

warn_log() {
  printf "${COLOR_YELLOW}$1${COLOR_END}${LINE}";
}

error_log() {
  printf "${COLOR_RED}$1${COLOR_END}${LINE}";
}

