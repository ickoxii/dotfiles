#!/usr/bin/env bash

logfile=~/baylor/projects/PrimeTimePets/cronlogs/git_user_check.log

echo "Current User: $(whoami)" > ${logfile}
echo "Git User Name: $(git config --global user.name)" >> ${logfile}
echo "Git User Email: $(git config --global user.email)" >> ${logfile}

echo "---------"
