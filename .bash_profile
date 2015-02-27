#
#  echo "Hello from /Users/donb/.profile@ -> dotfiles/.profile (local init for login shell)"
#

echo -n "Hello from "
ls -lF $BASH_ARGV | tr -s " "| cut -f9- -d" "

# on startup shell BASH_ARGV has full path while via "source" has only basename.
# so could do something like: ls -l $PWD/$BASH_SOURCE | tr -s " "| cut -f9- -d" "

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


#
#   aliases (now in file .aliases)
#

#alias ls='ls -atF'
#alias ..="cd .."
# [https://github.com/mathiasbynens/dotfiles/blob/master/.aliases]

#
#   functions
#

#  [ function ] name () compound-command [redirection]
#      This defines a function named name.  The reserved word function is optional.  If the  function
#      reserved word is supplied, the parentheses are optional.  The body of the function is the com-
#      pound command compound-command (see Compound Commands above).  That command is usually a  list
#      of  commands  between  {  and  }, but may be any command listed under Compound Commands above.
#      compound-command is executed whenever name is specified as the name of a simple command.   Any
#      redirections  (see  REDIRECTION below) specified when a function is defined are performed when
#      the function is executed.  The exit status of a function definition is zero  unless  a  syntax
#      error  occurs  or  a  readonly function with the same name already exists.  When executed, the
#      exit status of a function is the exit status of the last command executed in the  body.   (See
#      FUNCTIONS below.)

function histg () { history | grep $1 | sort -u -k 2 | grep -v "history | grep" | egrep -v "[0-9]  histg"; }

#
#   Bash Shell Prompt
#

#	 custom prompt string:
# PS1="\h:\w/ " 							# manny:~/ 
# PS1="(\!) \h:\w " 						# (501) manny:~ 
# PS1="\h:\w (\!) " 						# manny:~ (501) 
PS1='\[\e[1m\]\h:\w (\!) \[\e[m\]' 			# [BOLD]manny:~ (501) [END BOLD]

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

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
