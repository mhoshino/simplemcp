# Configure salt master
```
git clone https://github.com/mhoshino/simplemcp
ln -s ~/simplemcp/aio_mon/ /srv/salt/reclass/classes/cluster/mcpmhoshi
salt-call state.apply
```
# Configure AIO openstack node
```
salt-call state.apply linux
salt-call state.apply mysql
salt-call state.apply mysql # Yes do this twice
salt-call state.apply rabbitmq
salt-call state.apply
```
