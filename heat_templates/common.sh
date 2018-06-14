#!/bin/sh
sh -x
if [ `hostname` = "stacknamecfg_hostname" ]
then
  curl -O https://raw.githubusercontent.com/mirantisjp/simplemcp/master/install_salt_master.sh
  sh -x ./install_salt_master.sh stackname ubuntu_version ubuntu_code salt_version system_class_version
  curl -O https://raw.githubusercontent.com/mirantisjp/simplemcp/master/configure_model.sh
  sh -x ./configure_model.sh stackname deploy_name
else
  curl -O https://raw.githubusercontent.com/mirantisjp/simplemcp/master/install_salt_minion.sh
  sh -x ./install_salt_minion.sh cfg_ip ubuntu_version ubuntu_code salt_version
fi
