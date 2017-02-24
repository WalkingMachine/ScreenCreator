#!/bin/bash

#######
# Name: screenCreator.sh
# Author : Nicolas Nadeau
# execution : screenCreator.sh -n [SCREEN_NAME] -f [COMMANDS_LIST]
# Description : From a screen pid.name create a new windows with a
#               unique cmd execution
#
#

function checkCMD {
  #statements
  if ! type "$1" > /dev/null; then
    sudo apt-get install $1
  fi
}

# Get Args
while getopts n:f: option
do
        case "${option}"
        in
                n) NAME=${OPTARG}
                   checkCMD screen
                   ;;
                f) FILE=${OPTARG};;
        esac
done

if [ -z $NAME ]; then
  echo "No given name"
  NAME=$RANDOM
fi

if [ -z $FILE ]; then
  echo "Option File unset."
  exit 1
fi

# Check file exist
if [ ! -f $FILE ]; then
  echo "File \""$FILE"\" not found..."
  exit 1
fi

screen -a -dmS $NAME htop

# DEFAULT WINDOWS=0
n=1

# Read file
while IFS= read cmd
do
  #SCREEN CREATE NEW WINDOWS
  screen -S $NAME -X screen $n

  #SCREEN EXEC CMD IN WINDOWS
  screen -S $NAME -p $n -X stuff "$cmd
  "

	echo "$cmd"
  n=$((n+1))
done <"$FILE"
