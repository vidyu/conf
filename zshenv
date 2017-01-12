export ANDROID_HOME=$HOME/.android-sdk

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:./node_modules/.bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:/usr/local/heroku/bin"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Workspace
source /usr/bin/virtualenvwrapper.sh
fpath=(~/.zsh/completion/ $fpath)
autoload -Uz compinit && compinit -i
source /usr/share/nvm/init-nvm.sh

if [ -n "$DESKTOP_SESSION" ];then
        eval $(gnome-keyring-daemon --start)
        export SSH_AUTH_SOCK export GPG_AGENT_INFO
        export GNOME_KEYRING_CONTROL
        export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
fi
