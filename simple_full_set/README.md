# Install infra
```
git clone https://github.com/mirantisjp/simplemcp
source <keystonerc file>
heat stack-create -f simplemcp/heat_templates/simple_full_set.yaml <stack name>
```
# Configure salt master
```
heat output-show -a <stackname> # this will return secret key and ip
ssh -i <secret key> -l ubuntu <ip>
git clone https://github.com/mirantisjp/simplemcp
ln -sf ~/simplemcp/simple_full_set/ /srv/salt/reclass/classes/cluster/<stack name>
salt-call -l debug state.apply
```
# Configure AIO openstack node
```
salt "*aio*" -l debug state.apply linux,salt
salt "*aio*" saltutil.sync_all
salt "*aio*" -l debug state.apply mysql.server
salt "*aio*" -l debug state.apply
salt "*aio*" -l debug state.apply nova # need to run this again for cell configuration
```
# Configure Log nodes
```
salt "*log*" -l debug state.apply linux,salt
salt "*log*" saltutil.sync_all
salt "*log*" -l debug state.apply elasticsearch,kibana
salt "*log*" -l debug state.apply 
```
# Configure Cid nodes
```
salt "*cid*" -l debug state.apply linux,salt
salt "*cid*" -l debug saltutil.sync_all
salt "*cid*" -l debug state.apply glusterfs,haproxy,docker
salt "*cid*" -l debug state.apply openladp,gerrit,jenkins
salt "*cid*" -l debug state.apply jenkins # need to run this twice for jenkins config
salt "*cid*" -l debug state.apply
```
# Configure mon nodes
```
salt "*mon*" -l debug state.apply linux,salt
salt "*mon*" -l debug saltutil.sync_all
salt "*mon*" -l debug state.apply glusterfs,haproxy,devops_portal.config,rundeck.server,prometheus,docker
salt "*mon*" -l debug state.apply postgresql.client
salt "*mon*" -l debug state.apply prometheus
salt "*mon*" -l debug state.apply grafana
salt "*mon*" -l debug state.apply rundeck.client
salt "*mon*" -l debug state.apply
```
