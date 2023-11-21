#!/bin/bash


echo "Running unikraft benchmark"


sudo kraft stop --all
sudo kraft rm --all

sudo ip link set dev tap0 down 2> /dev/null
sudo ip link del dev tap0 2> /dev/null
sudo ip link set dev virbr0 down 2> /dev/null
sudo ip link del dev virbr0 2> /dev/null

sudo kraft net create virbr0 -n 172.44.0.1/24
sudo kraft run --memory 2G \
               --network bridge:virbr0 \
               -a netdev.ipv4_addr=172.44.0.2 -a netdev.ipv4_gw_addr=172.44.0.1 -a netdev.ipv4_subnet_mask=255.255.255.0
