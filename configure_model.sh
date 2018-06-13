#!/bin/bash
set -x

CLUSTERNAME=$1
DEPLOY_NAME=$2

git clone https://github.com/mirantisjp/simplemcp
ln -s /simplemcp/common /srv/salt/reclass/classes/cluster/common
if [ -n DEPLOY_NAME ]
then
  ln -s /simplemcp/$DEPLOY_NAME /srv/salt/reclass/classes/cluster/$CLUSTERNAME
  salt-call state.apply
  salt -C "*" state.apply linux,salt
  salt -C "*" saltutil.sync_all
fi

