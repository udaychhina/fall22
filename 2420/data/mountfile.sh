#!/bin/bash

#: Title       : mountfile
#: Date        : Oct 28 2022
#: Author      : Eddie Wang
#: Version     : 1.0
#: Description : Tests to see if a filesystem is mounted
#: Options     : None

#######################################
# Print a Usage message.
# Arguments:
#   None
# Outputs:
#   Write a help message
#######################################

usage() {
  echo -e "Usage: mountfile (DEVICE | FILESYSTEM)"
  echo 'Prints info about the device or filesystem.'
  exit 1
}

#######################################
# Log date and time error message
# Arguments:
#   
# Outputs:
#   Log message passed as argument
#######################################
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

# Storing variables
MNT_NAME=$1
INFO=$(findmnt -D $1 2> /dev/null)

# Confirm user has passed in an argument, if they didn't, return usage message
if [[ $# -lt 1 ]]; then
    echo "No argument given."
    usage
fi

# Error handling if findmnt exits with an error due to file system or device not existing
if [[ $? -eq 1 ]]; then
    err "Error: Filesystem or device does not exist."
    exit 1
else
# Print out the information
    AVAIL=$(echo "$INFO" | awk 'NR>1 {print $5}' )
    PERCENT=$(echo "$INFO" | awk 'NR>1 {print$6}')
    echo "$MNT_NAME has $AVAIL free space, with $PERCENT being used."
    exit 0
fi 



