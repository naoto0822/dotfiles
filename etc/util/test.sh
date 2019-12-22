#!/bin/bash

for file in $(echo "$DOTPATH/etc/osx/*.sh"); do
  echo $file
done
