[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kill then Load the ssh-agent and set the necessary env variables it outputs
sshRestart() {
    # if all else fails
    # pkill -u $(whoami) ssh-agent;

    if [ -n "$SSH_AUTH_SOCK" ] ; then
        eval `/usr/bin/ssh-agent -k`
    fi
    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa
    echo "Restarted SSH agent"
}

if [ -z "$SSH_AUTH_SOCK" ] || [[ $SSH_AUTH_SOCK == *"/private/tmp/"* ]] ; then
    eval `ssh-agent -s` > /dev/null 2>&1
    ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
fi
