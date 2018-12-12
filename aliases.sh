if [[ "`uname`" == "Linux" ]]; then
  alias update="sudo apt update && sudo apt-get full-upgrade && sudo apt autoremove && npm cache verify && npm -g upgrade && npm cache verify"
  alias docker-on="sudo systemctl start docker"
  alias docker-off="sudo systemctl stop docker"
elif [[ "`uname`" == "Darwin"* ]]; then
  alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && npm cache verify && npm -g upgrade && npm cache verify"
  alias sketch="sudo date 0314223217 && open /Applications/Sketch.app && sudo sntp -sS time.euro.apple.com"
fi

alias code="code-insiders"

# Ultility to code remote stuff on editor by tunneling
alias alia="ssh -R 52698:localhost:52698 alia.ml"

# Docker utils
alias stop="docker-compose kill"
alias restart="docker-compose restart"
alias containers="ctop -s mem"
alias log="docker-compose logs -f --tail 4"
alias logtail="docker-compose logs -f --tail 50"
alias build="docker-compose build --no-cache --pull"
alias up="docker-compose up -d"