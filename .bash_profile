# sets colors to look cool on the terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#############
## ALIASES ##
#############
alias ls='ls -GFh'
alias pip='/usr/local/bin/pip2'
alias weather='curl wttr.in'


#THEOS device settings
export THEOS=~/theos
export PATH=$THEOS/bin:$PATH
export THEOS_DEVICE_IP=localhost THEOS_DEVICE_PORT=2222
export PATH=~/.npm-global/bin:$PATH



# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Ruby Paths for env
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$HOME/gems/bin:$PATH
eval "$(rbenv init -)"
