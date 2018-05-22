
#!/bin/sh
set -x
PARAM1=$1
PARAM2=$2
PARAM3=$3
PARAM4=$4
MASTER_IP=${PARAM1}
UBUNTUVERSION=${PARAM2:-16.04}
UBUNTUCODE=${PARAM3:-xenial}
SALTVERSION=${PARAM4:-2016.3}

HOSTNAME=`hostname`
HOSTNAME_IP=`hostname -I | awk '{print $1}'`

# Add domain to etc_hosts if not configured 
sed -i "/^$HOSTNAME_IP  */d" /etc/hosts
echo "$HOSTNAME_IP $HOSTNAME $HOSTNAME.local" >> /etc/hosts

# Install software
apt-get update
apt-get install --no-install-recommends -y git
apt-get install git vim tree python-pip -y
pip install --upgrade pip

# Add salt repository
wget -O - https://repo.saltstack.com/apt/ubuntu/$UBUNTUVERSION/amd64/$SALTVERSION/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
cat > /etc/apt/sources.list.d/saltstack.list << EOF
deb http://repo.saltstack.com/apt/ubuntu/$UBUNTUVERSION/amd64/$SALTVERSION $UBUNTUCODE main
EOF
apt-get update  


# Install salt_minion
apt-get install salt-common salt-minion -y

cat > /etc/salt/minion.d/minion.conf << EOF
id: $HOSTNAME.local
master: $MASTER_IP
EOF

sleep 30
systemctl restart salt-minion
