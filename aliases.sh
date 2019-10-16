help() {
  echo "cloneSub <git-repo> <folder-name>   ---> clones repositories with submodules"
  echo "update-sub                          ---> updates child submodules"
  echo "find . -name '*.js' -type f -delete ---> find and deletes files recursively"
  echo "git rm -r --cached .                ---> removes git cache (ignorant files)"
}

nodeUp() {
  local nodeVersion=$(node -v)
  nvm install node --latest-npm --reinstall-packages-from=$nodeVersion
  nvm alias default node
  nvm uninstall $nodeVersion
  nvm cache clear
}

cloneSub() {
  git clone --recursive $1 $2
  cd $2
  git submodule foreach --recursive "git checkout master"
}

if [[ "`uname`" == "Darwin"* ]]; then
  alias update="sudo gem update && gem update --user && gem cleanup --user && sudo gem cleanup && brew update && brew upgrade && brew cask upgrade && brew cleanup && npm -g upgrade && npm cache verify && npm -g outdated"
  alias sketch="sudo date 1014193019 && open /Applications/Sketch.app && sudo sntp -sS time.euro.apple.com"
  # source $HOME/shellscripts/iterm_shell_integration.zsh
elif [[ "$(source /etc/os-release && echo $NAME)" == "Arch"* ]]; then
  alias update="sudo pacman -Syu && yay -Syu --aur --noconfirm && npm -g upgrade && npm cache verify && npm -g outdated"
elif [[ "$(source /etc/os-release && echo $NAME)" == "Ubuntu" ]]; then
  alias update="sudo apt update && sudo apt-get full-upgrade -y && sudo apt autoremove -y && npm -g upgrade && npm cache verify && npm -g outdated"
fi

alias up="update"
alias upgrade="update"
alias code="code-insiders"
alias zshrc="code ~/.zshrc"
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
