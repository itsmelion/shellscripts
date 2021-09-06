Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# invert mouse scroll direction
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }

refreshenv

choco feature enable -n allowGlobalConfirmation
choco install -y chocolatey-core.extension
choco install -y nodejs
choco install -y docker-desktop --pre
choco install -y googlechrome.canary
choco install -y powershell.core --pre
choco install -y git
choco install -y openssh
choco install -y 7zip
choco install -y curl
choco install -y wget
choco install -y gpg4win
choco install -y yarn
choco install -y vscode-insiders
choco install -y vlc
choco install -y gitkraken
choco install -y insomnia-rest-api-client
choco install -y firacode
choco install -y robo3t
choco install -y whatsapp
choco install -y slack
choco install -y steam-client
choco install -y thunderbird
choco install -y icloud

refreshenv

cp ..\git\.gitconfig $HOME
git config --global user.name "Christhopher Lion"
git config --global user.email christhopherleao@icloud.com
git config --global core.editor "code-insiders"
cp ..\git\.gitignore $HOME
git config --global core.excludesfile $HOME\.gitignore

cp ../.editorconfig $HOME

cd $HOME
