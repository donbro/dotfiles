#echo "hello from genie:~/.profile (local init file for login shell)"
echo "hello from "`hostname`":~/.profile (local init file for login shell)"

alias ls='ls -atF'
alias mysql=/usr/local/mysql/bin/mysql


function histg () { history | grep $1 | sort -u -k 2 | grep -v "history | grep" | egrep -v "[0-9]  histg"; }


#
#	 Make prompt string BOLD
#

# PS1="\h:\w/ " 							# manny:~/ 
# PS1="(\!) \h:\w " 						# (501) manny:~ 
# PS1="\h:\w (\!) " 						# manny:~ (501) 

PS1='\[\e[1m\]\h:\w (\!) \[\e[m\]' 			# [BOLD]manny:~ (501) [END BOLD]


PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'



#
#   virtualenvwrapper stuff
#

export WORKON_HOME=$HOME/projects/VENV

source /usr/local/bin/virtualenvwrapper.sh

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

echo "[ ctrl - a => start of line  ctrl - e ==> end of line ] "

##
# Your previous /Users/donb/.profile file was backed up as /Users/donb/.profile.macports-saved_2011-11-06_at_22:47:19
##

# MacPorts Installer addition on 2011-11-06_at_22:47:19: adding an appropriate PATH variable for use with MacPorts.

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# include Postgres App binarys into path (psql, 
# PostgreSQL ships with a constellation of useful binaries, 
# like pg_dump or pg_restore, that you will likely want to use. 
# Go ahead and add the /bin directory that ships with Postgres.app to your PATH 
# [http://postgresapp.com/documentation]

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"


# Finished adapting your PATH environment variable for use with MacPorts.

echo "path is:"$PATH | tr ":" "\n"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
