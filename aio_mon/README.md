# Configure salt master
```
git clone https://github.com/mhoshino/simplemcp
ln -s ~/simplemcp/aio_mon/ /srv/salt/reclass/classes/cluster/mcpmhoshi
salt-call state.apply
```
# Configure AIO openstack node
```
salt-call state.apply linux
salt-call state.apply mysql.server
salt-call state.apply mysql.client
salt-call state.apply rabbitmq
salt-call state.apply
```
