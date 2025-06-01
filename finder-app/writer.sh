#!/bin/bash

FILE=0
DIRECTORY=$1
FULL_PATH=0

#Check valid amount of parameters
if [ $# != 2 ]; then
    echo "Invalid parameters."
    exit 1
fi
#If provided file doesn't exist, create a file
if [ ! -f $1 ]; then
    FILE=${DIRECTORY##*/}
    echo "file "$FILE
    DIRECTORY=${DIRECTORY%/*}
    DIRECTORY=$DIRECTORY"/"
    echo "dir "$DIRECTORY
    if [ ! -d $DIRECTORY ]; then
        mkdir $DIRECTORY
    fi
    FULL_PATH=$DIRECTORY$FILE
    echo "full path "$FULL_PATH
    touch $FULL_PATH
fi

#If a file was created successfully, write a 2nd parameter content to it
if [ -f $1 ]; then
    echo $2>$1
    echo "OK "'$1'" "$1
else
    echo "Could not create a file "$1
    exit 1
fi

exit 0
