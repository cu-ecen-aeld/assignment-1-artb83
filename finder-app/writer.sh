#!/bin/bash
#$1 Full path to the file.
#$2 String to write into the file that pointed by the $1 path.

FILE=0
DIRECTORY=$1
FULL_PATH=0

#Check valid amount of parameters
if [ $# != 2 ]; then
    echo "Invalid parameters."
    exit 1
fi
#If provided file or directory doesn't exist, create a directory and a file
if [ ! -f $1 ]; then
    FILE=${DIRECTORY##*/}
    DIRECTORY=${DIRECTORY%/*}
    DIRECTORY=$DIRECTORY"/"
    if [ ! -d $DIRECTORY ]; then
        mkdir $DIRECTORY
    fi
    FULL_PATH=$DIRECTORY$FILE
    touch $FULL_PATH
fi

#If a file was created successfully, write desired content ($2) to it, or report an error.
if [ -f $1 ]; then
    echo $2>$1
else
    echo "Could not create a file "$1
    exit 1
fi

exit 0
