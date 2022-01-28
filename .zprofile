export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
# Alias for Yubikey pin prompt
alias yubact="ssh-add -e /usr/local/lib/opensc-pkcs11.so; ssh-add -s /usr/local/lib/opensc-pkcs11.so"


# Auto finds ssh-agent
. ~/yubikey_scripts/ssh-find-agent/ssh-find-agent.sh
ssh_find_agent -a
if [ -z "$SSH_AUTH_SOCK" ]
then
    eval $(ssh-agent) > /dev/null
    ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi


# Auto prompt yubikey on new terminal
ioreg -p IOUSB | grep -i yubikey >/dev/null
YUBIKEY_STATUS=$?
ssh-add -L >/dev/null
ACTIVE_STATUS=$?
if [ $YUBIKEY_STATUS -eq 0 ] && [ $ACTIVE_STATUS -eq 1 ]; then
    yubact
fi


export SKYREV_REMOTE_USER=tombojanin
export PATH=/Users/skydio/aircam/build/host_aircam/bin:$PATH
export PATH=/usr/local/Cellar/autopep8/1.4.3/bin/autopep8:$PATH
export AIRCAM_ROOT=/Users/skydio/aircam
export EDITOR='vim'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

# Useful aliases
alias deld='rm -rf /Users/tom/Library/Developer/Xcode/DerivedData/*'
alias sshpad='ssh -A tombojanin@192.168.50.217'
alias sshpanther='ssh -A mobiledev2@panther'
alias releasepad='ssh mobiledev@192.168.5.13'
alias tckr='while true; do clear; bash ~/ticker.sh $(cat ~/.ticker.conf); sleep 2; done'
alias iml='make ios_libs_device'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gpp='git pull'
