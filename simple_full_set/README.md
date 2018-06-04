# Configure salt master
```
salt-call state.apply
```
# Configure AIO openstack node
```
salt-call state.apply linux
salt-call state.apply salt
salt-call state.apply mysql.server
salt-call state.apply mysql.client
salt-call state.apply rabbitmq
salt-call state.apply
salt-call state.apply nova # need to run this again for cell configuration
```
# Configure Log nodes
```
salt-call state.apply linux
salt-call state.apply salt
salt-call state.apply elasticsearch
salt-call state.apply kibana
salt-call state.apply 
```
# Configure Cid nodes
```
salt-call state.apply linux
salt-call state.apply salt
salt-call saltutil.sync_all
salt-call state.apply glusterfs
salt-call state.apply haproxy
salt-call state.apply docker
salt-call state.apply openldap
salt-call state.apply gerrit
salt-call state.apply jenkins
salt-call state.apply jenkins # need to run this twice for jenkins config
salt-call state.apply
```
# Configure mon nodes
```
salt-call state.apply linux
salt-call state.apply salt
salt-call saltutil.sync_all
salt-call state.apply glusterfs
salt-call state.apply haproxy
salt-call state.apply devops_portal.config
salt-call state.apply rundeck.server
salt-call state.apply prometheus
salt-call state.apply docker
salt-call state.apply postgresql.client
salt-call state.apply prometheus
salt-call state.apply grafana
salt-call state.apply rundeck.client
```
