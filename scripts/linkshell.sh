echo "Overriding your ZSHRC"

LION_SHELL="$(npm root -g)/lion-shellscripts"

echo "export LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc
