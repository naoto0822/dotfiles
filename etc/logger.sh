#!/bin/sh

COLOR_RED="\e[31m"
COLOR_YELLOW="\e[32m"
COLOR_BLUE="\e[34m"
COLOR="\e[37m"
COLOR_END="\e[m"
LINE="\n"

info_log() {
  printf "${COLOR_BLUE} [INFO] %s${COLOR_END}${LINE}" $1;
}

warn_log() {
  printf "${COLOR_YELLOW} [WARN] %s${COLOR_END}${LINE}" $1;
}

error_log() {
  printf "${COLOR_RED} [ERROR] %s${COLOR_END}${LINE}" $1;
}

