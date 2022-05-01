#!/bin/bash
token=$(vagrant ssh --no-tty -c "sudo cat /vagrant/node-token" vricheseS)
echo "Syncing token: $token"
vagrant ssh --no-tty -c "sudo echo $token > /vagrant/node-token" vricheseSW
