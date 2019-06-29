Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
choco install -y chocolatey-core.extension
choco install -y nodejs
choco install -y docker-desktop
choco install -y googlechrome
choco install -y googlechrome.canary
choco install -y powershell-core
choco install -y powershell-preview
choco install -y hyper
choco install -y git
choco install -y openssh
choco install -y 7zip
choco install -y curl
choco install -y wget
choco install -y yarn
choco install -y vscode
choco install -y vscode-insiders
choco install -y k-litecodecpackfull
choco install -y vlc
choco install -y spotify
choco install -y googledrive
choco install -y gitkraken
choco install -y insomnia-rest-api-client
choco install -y firacode
choco install -y robo3t
choco install -y docker-kitematic
choco install -y whatsapp
choco install -y slack

refreshenv
cp ..\git\.gitconfig $HOME
git config --global user.name "Christhopher Lion"
git config --global user.email christhopherleao@icloud.com
git config --global core.editor code
cp ..\git\.gitignore $HOME
git config --global core.excludesfile $HOME\.gitignore

cp ../.editorconfig $HOME

cd $HOME
mkdir sites
