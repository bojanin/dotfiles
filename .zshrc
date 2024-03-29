
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git

precmd () { vcs_info }
PROMPT='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f%# '


export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-11.0.12.jdk/Contents/Home'
export RIPGREP_CONFIG_PATH=~/.ripgreprc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
if [ -e /Users/tom.bojanin/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tom.bojanin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib":$LDFLAGS
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include":$CPPFLAGS
