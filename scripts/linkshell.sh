LION_SHELL="$(npm root -g)/lion-shellscripts"
echo "Overriding your ZSHRC to $LION_SHELL"
echo "dont forget your secrets."

echo "export LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc
