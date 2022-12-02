export WINDOWS_HOME='/mnt/c/Users/Christhopher Leao'
export WINDOWS='/mnt/c/Users/Christhopher Leao'
export W='/mnt/c/Users/Christhopher Leao'

help() {
  echo "OpenSSL is known to fail on macOS. Case that happens, run gem update with the following arguments:"
  echo "gem update --user -- --with-openssl-dir=/usr/local/Cellar/openssl@1.1/1.1.1s"
  echo ""
  echo "cloneSub <git-repo> <folder-name>   ---> clones repositories with submodules"
  echo "update-sub                          ---> updates child submodules"
  echo "find . -name '*.js' -type f -delete ---> find and deletes files recursively"
  echo "prune SOME_FILE                     ---> find and deletes files recursively"
  echo "git rm -r --cached .                ---> removes git cache (ignorant files)"
  echo "'CMD + Shift + .'                   ---> toggle hidden folders on Mac"
}

nvmInstall(){
  nvm install $1 --latest-npm --reinstall-packages-from=node
}

noderange() {
  local previous=$(nvm current)
  nvm install $1 --latest-npm --reinstall-packages-from=current
  nvm uninstall $previous
  nvm cache clear
}

nodeup() {
  local nodeVersion=$(nvm current)
  nvm install node --latest-npm --reinstall-packages-from=node
  # OR --reinstall-packages-from=$nodeVersion
  # OR --reinstall-packages-from=current
  nvm alias default node
  nvm uninstall $nodeVersion
  nvm cache clear
  linkshell
}
alias nodeUp=nodeup

cloneSub() {
  local MAIN=$(git symbolic-ref --short HEAD)
  git clone --recursive $1 $2
  cd $2
  git submodule foreach --recursive "git checkout $MAIN"
}

if [[ "`uname`" == "Darwin"* ]]; then
  update() {
    # get updates
    mas upgrade
    brew update &
    gem update --user &
    npm upgrade --location=global &
    wait
    brew upgrade &
    wait
    brew upgrade --cask &
    wait
    fg
    # cleanups
    gem cleanup --user &
    brew cleanup &
    npm cache verify &
    wait
    npm outdated --location=global
    softwareupdate --all
    # flags --download
  }
  # Sketch hack.. (MONTH|DAY|HH|MIN|YY)
  alias sketch="sudo date 0228111120 && open /Applications/Sketch.app && sudo sntp -sS time.euro.apple.com"
  # source $HOME/shellscripts/iterm_shell_integration.zsh
elif [[ "$(source /etc/os-release && echo $NAME)" == "Arch"* ]]; then
  alias update="sudo pacman -Syu && yay -Syu --aur --noconfirm && npm upgrade --location=global && npm cache verify && npm outdated --location=global"
elif [[ "$(source /etc/os-release && echo $NAME)" == "Ubuntu" ]]; then
  alias update="sudo apt update && sudo apt-get full-upgrade -y && sudo apt autoremove -y && npm upgrade --location=global && npm cache verify && npm outdated --location=global"
fi

alias upgrade="update"
alias code="code-insiders"
alias zshrc="code $LION_SHELL/zshconfig.sh"

j15() { export JAVA_HOME=`/usr/libexec/java_home -v 15`; java -version }
j8() { export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version }
# Ultility to code remote stuff on editor by tunneling
alias alia="ssh -R 52698:localhost:52698 api.alia.ml"

# Docker utils
alias stop="docker-compose kill"
alias restart="docker-compose restart"
alias containers="ctop -s mem"
alias log="docker-compose logs -f --tail 20"
alias logtail="docker-compose logs -f --tail 100"
alias build="docker-compose pull && docker-compose build --pull"
alias up="docker-compose up -d"
alias docker-start="sudo systemctl start docker"
alias docker-on="sudo systemctl start docker"
alias docker-stop="sudo systemctl stop docker"
alias docker-off="sudo systemctl stop docker"

# DEV
alias peers="npx install-peerdeps"
alias dedupe="yarn-deduplicate --strategy=highest yarn.lock"
publish() {
  local defaultTag='next'
  yarn publish --prerelease --tag ${defaultTag:-$1}
}

# SERVER
alias nginx-restart="sudo service nginx restart"
alias nginx-test="sudo nginx -c $HOME/nginx/nginx.conf -t"
alias addssl="sudo certbot --nginx"

if [[ -n $SSH_CONNECTION ]]; then
  alias code="rmate"
fi

rebuild() {
  docker-compose pull $1
  docker-compose build $1 --pull
}

alias update-sub="git submodule update --init --recursive"
alias crlf="find ./ ! -path \"./node_modules/*\" -type f -exec dos2unix {} \;"

# Deletes a file recursively
prune() {
  find . -name $1 -exec rm -rf {} \;
}

shellSecrets() {
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -fsSL https://api.github.com/repos/itsmelion/keychain/contents/shell.sh > $HOME/.secrets.sh
}

# AZURE KEYVAULT
get-env() {
  if ! hash jq 2>/dev/null
    then
      az keyvault secret show --vault-name hwbg-webhosting-keyvault --name $1
    else
      az keyvault secret show --vault-name hwbg-webhosting-keyvault --name $1 | jq -r '.value'
  fi
}

set-env() {
  az keyvault secret set --vault-name hwbg-webhosting-keyvault --name $1 --file $2
}
# AZURE KEYVAULT
