if [ -n "$DESKTOP_SESSION" ];then
        eval $(gnome-keyring-daemon --start)
        export SSH_AUTH_SOCK export GPG_AGENT_INFO
        export GNOME_KEYRING_CONTROL
        export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
fi
