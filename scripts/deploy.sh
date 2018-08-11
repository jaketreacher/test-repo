#! /bin/bash

#----------------------------------------------------------#
#                 Variables & Verifications                #
#----------------------------------------------------------#

MODE="$1"

if [ -z $MODE ]; then exit 1; fi

# Env Vars
if [ -z $REMOTEUSER ]; then exit 1; fi
if [ -z $REMOTEADDRESS ]; then exit 1; fi

# SSH Key
if [ ! -f "travis_deploy" ]; then exit 1; fi

#----------------------------------------------------------#
#                       Action                             #
#----------------------------------------------------------#

if [ "$MODE" == "production" ]; then
    ssh -i travis_deploy $REMOTEUSER@$REMOTEADDRESS 'bash -s' < scripts/production.sh
elif [ "$MODE" == "staging" ]; then
    ssh -i travis_deploy $USER@$REMOTEADDRESS 'bash -s' < scripts/staging.sh
else
    echo "No mode selected."
    exit 1
fi
