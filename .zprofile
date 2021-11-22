# design
export PS1="\u::\w"
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
# go stuff
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#DEVICE SETTINGS
export THEOS=~/theos
export THEOS_MAKE_PATH=$THEOS/makesfiles/
export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=2222

export MonkeyDevDeviceIP=192.168.50.70
export MonkeyDevDevicePort=22
export MonkeyDevDevicePassword=alpine

# python virtual env
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/local/bin/python3 '
export PROJECT_HOME=$HOME/Desktop/python_projects
source /usr/local/bin/virtualenvwrapper.sh

# personal commands
alias obs='/Applications/OBS.app/Contents/MacOS/OBS'
alias deld='rm -rf /Users/tommy/Library/Developer/Xcode/DerivedData/*'
alias bandwhich='sudo bandwhich -i en0'
alias vim='/usr/local/Cellar/macvim/8.2-162/MacVim.app/Contents/MacOS/Vim'
export PATH="/usr/local/sbin:$PATH"

alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gpp='git pull'
export EDITOR='vim'
