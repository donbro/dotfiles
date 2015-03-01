#
#  echo "Hello from /Users/donb/.profile@ -> dotfiles/.profile (local init for login shell)"
#
echo -n "Hello from "
ls -lF $BASH_ARGV | tr -s " "| cut -f9- -d" "

# 
#   Source each "sub profile"
# 

for file in ~/{.path,.bash_prompt,.exports,.aliases,.functions,.extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file" && echo "sourced " $file ;
done;
unset file;

#
#   aliases (now in file .aliases)
#

#
#   functions (now in .functions)
#

#function histg () { history | grep $1 | sort -u -k 2 | grep -v "history | grep" | egrep -v "[0-9]  histg"; }

#
#   Bash Shell Prompt (now in .bash_prompt)
#

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

#	
#   Virtualenv 
#   

export WORKON_HOME=/Users/donb/VENV/
source /usr/local/bin/virtualenvwrapper.sh

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

echo "Virtualenv wrapper VENV is at: "$WORKON_HOME

#export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin/:$PATH

# from MacPorts 
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#
#   Output Final Path
#

echo "Path is:"
echo -n "    "
echo $PATH | sed -e 's/[:]/\
    /g'
echo

#
#   Describe System Python
#

echo -n "System python is" `which python`". "
python -V
echo -n "System python libraries are at " 
python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"
echo

#
#   Some emacs hints for command line navigation
#

echo "[ ctrl - a => start of line  ctrl - e ==> end of line ]"
