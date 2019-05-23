#!/usr/bin/env bash

# Check the status of I2P routers and crawling processes on the involved VMs
# Author: Roberto Magan, 2019

# list of all VM instances
vm_list=`cat allinstances.txt`

# Remote scripts path
script_path=~/RMAGAN/projects/I2P_Crawler/scripts


# Deployment
for vm in $vm_list;
do
  echo "######### VM $vm ############"
  echo "[+] I2prouter status on $vm ..."
  ssh $vm "systemctl status i2p | grep -e \"Active\""
  echo " "

  echo "[+] Crawling process status on $vm ..."
  ssh $vm "ps -ef | grep manager.py"
  echo " "

  echo "[+] HD status $vm ..."
  ssh $vm "df -kh | grep -e \"sd\""
  echo " "

  echo "[+] MEM status $vm ..."
  ssh $vm "free -h"
  echo " "

  echo "---- VM $vm -----"
  echo " "

done
