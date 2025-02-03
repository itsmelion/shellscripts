# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# (robbyrussell | agnoster)
ZSH_THEME="robbyrussell"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"


# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7
export DISABLE_UPDATE_PROMPT=true
export NX_DAEMON=false

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
# export LANG="en_US.UTF-8"
# export LANGUAGE="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"
export GPG_TTY=$(tty)


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="rmate"
else
  export EDITOR="code"
fi

export REACT_EDITOR="code"

source $LION_SHELL/aliases.sh
source $HOME/.secrets.sh
source $ZSH/oh-my-zsh.sh

# Android SDK
if [[ "`uname`" == "Darwin"* ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
else
  export ANDROID_HOME=$HOME/cmdline-tools
fi
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$PATH:$JAVA_HOME/bin
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
# /Ruby
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

# NVM
export NVM_LAZY_LOAD=true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Calling nvm use automatically in a directory with a .nvmrc file:
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# End: Calling nvm use automatically

# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi


plugins=(git, zsh-syntax-highlighting)
