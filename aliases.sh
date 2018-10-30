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