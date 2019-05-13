#!/usr/bin/env bash

# Setup, configure and run all the crawling processes on all the involved VMs
# Author: Roberto Magan, 2019

# list of VM instances
vm_list=`cat instances.txt`

# Remote scripts path
script_path=$HOME/RMAGAN/projects/I2P_Crawler/scripts

# Deployment
for vm in vm_list;
do
  echo "[+] Setting up process on $vm ..."
  ssh $vm "bash $script_path/setup.sh"

  echo "[+] Configuring crawling process on $vm ..."
  bash configuration.sh $vm

  echo "[+] Setting up process on $vm ..."
  ssh $vm "bash $script_path/start.sh $vm"

done
