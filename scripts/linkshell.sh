#!/usr/bin/env bash

echo "Overriding your ZSHRC"

LION_SHELL="$(npm root -g)/lion-shellscripts"

echo "LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc
