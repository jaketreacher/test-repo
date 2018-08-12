#! /bin/bash
exit 1
#----------------------------------------------------------#
#                 Variables & Verifications                #
#----------------------------------------------------------#

MODE="$1"

if [ -z $MODE ]; then echo "Bad Mode"; exit 1; fi

# Env Vars
if [ -z $REMOTEUSER ]; then echo "No User"; exit 1; fi
if [ -z $REMOTEADDRESS ]; then echo "No Address"; exit 1; fi

#----------------------------------------------------------#
#                       Action                             #
#----------------------------------------------------------#

if [ "$MODE" == "production" ]; then
    echo "Deploying: production"
    ssh $REMOTEUSER@$REMOTEADDRESS 'bash -s' < scripts/production.sh
elif [ "$MODE" == "staging" ]; then
    echo "Deploying: staging"
    ssh $REMOTEUSER@$REMOTEADDRESS 'bash -s' < scripts/staging.sh
else
    echo "No mode selected."
    exit 1
fi
echo "Success"