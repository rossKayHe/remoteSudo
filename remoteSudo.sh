#!/bin/bash
user=$1
cmd=$2
host=$3
read -p 'Password: ' -s PWD

function usage {
  echo "Usage remoteSudo.sh <user> <command> <host file||comma delimited list>"
  exit
}

# Check number of arguments
if  [ "$#" -ne 3 ]; then
  usage
fi

# Check for comma delimited list or filename
if [[ $host == *[,]* ]]; then
  IFS=',' read -r -a hosts <<< "$host"
elif [[ $host == *"/"* ]]; then
  IFS=$'\n' read -d '' -r -a hosts < $host
else
  usage
fi

# install sshpass if not already installed
if [ ! $(echo $PWD | sudo -S yum list sshpass | grep 'Installed Packages') ]; then
  echo $PWD | sudo -S yum install sshpass -y
fi

# Check if command is has semicolon separators
if [[ $cmd == *";"* ]]; then
  arrCMD=(${cmd//;/ })
  # Run remote sudo commands on list of hosts
  for h in "${hosts[@]}"
  do
    echo ""
    echo $h
    for cmd1 in "${arrCMD[@]}"
    do
      sshpass -p $PWD ssh  -o "StrictHostKeyChecking no" $user@$h "echo $PWD | sudo -S $cmd1"
    done
  done
else
  # Run remote sudo command on list of hosts
  for h in "${hosts[@]}"
  do
    echo $h
    sshpass -p $PWD ssh  -o "StrictHostKeyChecking no" $user@$h "echo $PWD | sudo -S $cmd"
  done
fi
