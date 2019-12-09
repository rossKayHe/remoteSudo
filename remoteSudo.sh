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
if [[ $3 == *[,]* ]]; then
  IFS=',' read -r -a hosts <<< "$3"
elif [[ $3 == *"/"* ]]; then
  IFS=$'\n' read -d '' -r -a hosts < $3
else
  usage
fi

# install sshpass if not already installed
if [ ! $(echo $PWD | sudo -S yum list sshpass | grep 'Installed Packages') ]; then
  echo $PWD | sudo -S yum install sshpass -y
fi

# Run remote sudo command on list of hosts
for h in "${hosts[@]}"
do
  sshpass -p $PWD ssh  -o "StrictHostKeyChecking no" $1@$h "echo $PWD | sudo -S $2"
done
