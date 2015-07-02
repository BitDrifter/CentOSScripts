#Function to print red error text in terminal
printError() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

#Script needs to be run as root, so verify this.
if [[ $EUID -ne 0 ]]; then
  printError "This script should be run using sudo or as the root user"
  exit 1
fi

#Navigate to directory where bash loads its completion scripts
cd /etc/bash_completion.d 

#Download the git completion script
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash

#Load the completion script now so we don't have to wait for a restart
source git-completion.bash
