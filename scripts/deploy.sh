#! /bin/bash

#----------------------------------------------------------#
#                 Variables & Verifications                #
#----------------------------------------------------------#

MODE="$1"

if [ -z $MODE ]; then echo "Bad Mode"; exit 1; fi

# Env Vars
if [ -z $REMOTEUSER ]; then echo "No User"; exit 1; fi
if [ -z $REMOTEADDRESS ]; then echo "No Address"; exit 1; fi

# SSH Key
if [ ! -f "travis_deploy" ]; then exit 1; fi

#----------------------------------------------------------#
#                       Action                             #
#----------------------------------------------------------#

echo "One";
if [ "$MODE" == "production" ]; then
    echo "Two";
    ssh -i travis_deploy $REMOTEUSER@$REMOTEADDRESS 'bash -s' < scripts/production.sh
elif [ "$MODE" == "staging" ]; then
    echo "Three";
    ssh -i travis_deploy $REMOTEUSER@$REMOTEADDRESS 'bash -s' < scripts/staging.sh
else
    echo "No mode selected."
    exit 1
fi
echo "Four";