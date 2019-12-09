#!/bin/bash
user=$1
pwd=$2
cmd=$3
host=$4

function usage {
  echo "Usage remoteSudo.sh <user> <password> <command> <host file||comma delimited list>"
  exit
}

# install sshpass if not already ibnstalled
if [ ! echo $2 | sudo -S yum list sshpass | grep 'Installed Packages' ]; then
  echo $2 | sudo -S yum install sshpass -yum
fi

# Check number of arguments
if  [ "$#" -ne 4 ]; then
  usage
fi

# Check for comma delimited list or filename
if [[ $4 == *[,]* ]]; then
  IFS=',' read -r -a hosts <<< "$4"
elif [[ $4 == *"/"* ]]; then
  IFS=$'\n' read -d '' -r -a hosts < $4
else
  usage
fi

# Run remote sudo command on list of hosts
for h in "${hosts[@]}"
do
  sshpass -p $2 ssh  -o "StrictHostKeyChecking no" $1@$h "echo $2 | sudo -S $3"
done
