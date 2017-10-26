#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(~/.zsh/completion $fpath)

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

source <(gopass completion bash)


# Customize to your needs...
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    # export SSH_AUTH_SOCK export GPG_AGENT_INFO
    export GNOME_KEYRING_CONTROL
    export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
fi
