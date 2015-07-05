#Function to print red error text in terminal
printError() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

#Function to print yellow warning text in terminal
printWarning() {
  printf '\E[33m'; echo "$@"; printf '\E[0m'
}

#Script needs to be run as root, so verify this.
if [[ $EUID -ne 0 ]]; then
  printError "Error: This script needs to be run using sudo or as the root user"
  exit 1
fi

#Navigate to directory where bash loads its completion scripts
cd /etc/bash_completion.d 

#Download the lastet git completion script
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash

#Load the completion script now so we don't have to wait for a restart
source git-completion.bash

#Change to directory where the global bashrc is located
cd /etc

BASHRC_FILE="/etc/bashrc"
SOURCE_GIT_COMPLETION_COMMAND="source /etc/bash_completion.d/git-completion.bash"

#Check if bashrc has already been updated to load git-completion.bash
if grep -Fxq $SOURCE_GIT_COMPLETION_COMMAND $BASHRC_FILE
then
  #Modify the global bashrc to load the git-completion script
  echo $SOURCE_GIT_COMPLETION_COMMAND >> $BASHRC_FILE
else
  echo "Warning: Global bashrc already updated to load git-completion.bash"
fi
