LION_SHELL="$(dirname $(realpath $0))"
echo "Overriding your ZSHRC to $LION_SHELL"
echo "dont forget your secrets."

echo "export LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc
