# Inception-of-Things

Running k3s cluster on VM-s and with k3d.

## Part 1, 2

Runs k3s with Vagrant.

## Part 3, Bonus

Runs k3s with Docker and nested container runtime.

## Principal schema of different k3s deployments

![alt text](images/schema.png)


## Testing environment

Ubuntu 20.04 with amd64 CPU

## Prerequisites for Part 1 and Part 2

[Vagrant with libvirt provider](https://github.com/vagrant-libvirt/vagrant-libvirt#installation)

For example Ubuntu:

```
sudo apt-get build-dep vagrant ruby-libvirt
sudo apt-get install -y qemu libvirt-daemon-system libvirt-clients ebtables dnsmasq-base
sudo apt-get install -y libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
sudo apt-get install -y libguestfs-tools
vagrant plugin install vagrant-libvirt
sudo gem install rexml
```

Then logout for groups update

## Deploy Part 1 and Part 2

`vagrant up --provider libvirt`

## Prerequisites for Part 3 and Bonus

[Install k3d](https://k3d.io/v5.4.1/#installation)
