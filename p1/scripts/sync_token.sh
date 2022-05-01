#!/bin/bash
token=$(vagrant ssh --no-tty -c "sudo cat /vagrant/node-token" vricheseS)
while ! vagrant ssh --no-tty -c "sudo echo $token > /vagrant/node-token" vricheseSW
do
  echo "Waiting agent node ssh to be available"
  sleep 3
done
