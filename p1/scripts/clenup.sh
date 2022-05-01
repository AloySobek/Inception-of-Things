#!/bin/bash
sudo virsh destroy p1_vricheseSW
sudo virsh destroy p1_vricheseS
sudo virsh undefine p1_vricheseS
sudo virsh undefine p1_vricheseSW
sudo virsh vol-delete --pool default p1_vricheseS.img
sudo virsh vol-delete --pool default p1_vricheseSW.img
