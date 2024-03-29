export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
# Alias for Yubikey pin prompt
alias yubact="ssh-add -e /usr/local/lib/opensc-pkcs11.so; ssh-add -s /usr/local/lib/opensc-pkcs11.so"


# Auto finds ssh-agent
# . ~/yubikey_scripts/ssh-find-agent/ssh-find-agent.sh
# ssh_find_agent -a
# if [ -z "$SSH_AUTH_SOCK" ]
# then
#     eval $(ssh-agent) > /dev/null
#     ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
# fi


# Auto prompt yubikey on new terminal
ioreg -p IOUSB | grep -i yubikey >/dev/null
YUBIKEY_STATUS=$?
ssh-add -L >/dev/null
ACTIVE_STATUS=$?
if [ $YUBIKEY_STATUS -eq 0 ] && [ $ACTIVE_STATUS -eq 1 ]; then
    yubact
fi


# AIRCAM SETTINGS
export SKYREV_REMOTE_USER=tombojanin
export PATH=/Users/skydio/aircam/build/host_aircam/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.8/bin:$PATH
export AIRCAM_ROOT=/Users/skydio/aircam
export EDITOR='vim'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-11.0.12.jdk/Contents/Home'
export DISABLE_MOBILE_PTREE_CHECKING=true

# Useful aliases
alias deld='rm -rf $HOME/Library/Developer/Xcode/DerivedData/*'
alias sshpad='ssh tomabojanin@10.100.26.28'
alias sshpanther='ssh -A mobiledev2@panther'
alias releasepad='ssh mobiledev@192.168.5.13'
alias tckr='while true; do clear; bash ~/ticker.sh $(cat ~/.ticker.conf); sleep 2; done'
alias iml='make ios_libs_device'
alias ims='make ios_libs_sim'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gpp='git pull'

eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/versions/2.7.18/bin:$PATH"     
eval "$(pyenv init --path)"                                                                                                                                                       
export AWS_PROFILE=tsb-m1-mac
