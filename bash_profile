#echo "hello from .bash_profile. now with keychain"

# " •"
echo -n " • hello from "
/bin/ls -lF "$BASH_ARGV" | tr -s " "| cut -f9- -d" "
# trimmed down from: -rw-r--r--  1 donb  donb  448 Oct 25 19:17 /home/donb/.bash_profile

eval `keychain --eval id_rsa`

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export WORKON_HOME=~/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
