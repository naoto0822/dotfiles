#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

info_log "[INFO] exec common.sh"

# Ruby Bundler
gem install bundler

