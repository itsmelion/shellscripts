export WINDOWS_HOME='/mnt/c/Users/Christhopher Leao'
export WINDOWS='/mnt/c/Users/Christhopher Leao'
export W='/mnt/c/Users/Christhopher Leao'

help() {
  echo "cloneSub <git-repo> <folder-name>   ---> clones repositories with submodules"
  echo "update-sub                          ---> updates child submodules"
  echo "find . -name '*.js' -type f -delete ---> find and deletes files recursively"
  echo "git rm -r --cached .                ---> removes git cache (ignorant files)"
  echo "'CMD + Shift + .'                   ---> toggle hidden folders on Mac"
}

nodeUp() {
  local nodeVersion=$(node -v)
  nvm install node --latest-npm --reinstall-packages-from=node
  # OR --reinstall-packages-from=$nodeVersion
  # OR --reinstall-packages-from=current
  nvm alias default node
  nvm uninstall $nodeVersion
  nvm cache clear
  linkshell
}

cloneSub() {
  local MAIN=$(git symbolic-ref --short HEAD)
  git clone --recursive $1 $2
  cd $2
  git submodule foreach --recursive "git checkout $MAIN"
}

if [[ "`uname`" == "Darwin"* ]]; then
  update() {
    # get updates
    brew update &
    gem update --user &
    npm -g upgrade &
    wait
    brew upgrade &
    wait
    brew upgrade --cask &
    wait
    # cleanups
    gem cleanup --user &
    brew cleanup &
    npm cache verify &
    wait
    softwareupdate --download --all
    npm -g outdated
  }
  # Sketch hack.. (MONTH|DAY|HH|MIN|YY)
  alias sketch="sudo date 0228111120 && open /Applications/Sketch.app && sudo sntp -sS time.euro.apple.com"
  # source $HOME/shellscripts/iterm_shell_integration.zsh
elif [[ "$(source /etc/os-release && echo $NAME)" == "Arch"* ]]; then
  alias update="sudo pacman -Syu && yay -Syu --aur --noconfirm && npm -g upgrade && npm cache verify && npm -g outdated"
elif [[ "$(source /etc/os-release && echo $NAME)" == "Ubuntu" ]]; then
  alias update="sudo apt update && sudo apt-get full-upgrade -y && sudo apt autoremove -y && npm -g upgrade && npm cache verify && npm -g outdated"
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
alias dedupe="yarn-dedupe --strategy highest yarn.lock"
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
