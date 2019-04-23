if [[ "`uname`" == "Linux" ]]; then
  alias update="sudo apt update && sudo apt-get full-upgrade && sudo apt autoremove && npm cache verify && npm -g upgrade && npm cache verify"
  alias docker-on="sudo systemctl start docker"
  alias docker-off="sudo systemctl stop docker"
elif [[ "`uname`" == "Darwin"* ]]; then
  alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && npm cache verify && npm -g upgrade && npm cache verify"
  alias sketch="sudo date 0314223218 && open /Applications/Sketch.app && sudo sntp -sS time.euro.apple.com"
fi

if grep -q Microsoft /proc/version; then
  alias docker="docker.exe"
  alias docker-compose="docker-compose.exe"
  alias crlf="find ./ -type f -exec dos2unix {} \;"
fi

alias up="update"
alias upgrade="update"
alias code="code-insiders"
alias zshconfig="code ~/.zshrc"
alias zshconf="code ~/.zshrc"
alias zshrc="code ~/.zshrc"
# Ultility to code remote stuff on editor by tunneling
alias alia="ssh -R 52698:localhost:52698 api.alia.ml"

# Docker utils
alias docker-start="sudo systemctl start docker"
alias docker-stop="sudo systemctl stop docker"
alias stop="docker-compose kill"
alias restart="docker-compose restart"
alias containers="ctop -s mem"
alias log="docker-compose logs -f --tail 7"
alias logtail="docker-compose logs -f --tail 100"
alias build="sudo docker-compose build --no-cache --pull"
alias up="docker-compose up -d"

nodeUpgrade() {
  local nodeVersion=$(node -v)
  nvm install node --latest-npm --reinstall-packages-from=$nodeVersion
  nvm alias default node
  nvm uninstall $nodeVersion
  nvm cache clear
}

sync-config() {
  gist -u 79c6c87287160bdb161ebfa856243693 $HOME/.zshrc
}

download-config() {
  curl -L https://gist.github.com/itsmelion/79c6c87287160bdb161ebfa856243693 -o $HOME/.zshrc
}
