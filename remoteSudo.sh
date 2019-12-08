#!/bin/bash
user=$1
pwd=$2
cmd=$3
host=$4
function usage {
  echo "Usage remoteSudo.sh <user> <password> <command> <host file||comma delimited list>"
  exit
}
if  [ "$#" -ne 4 ]; then
  usage
fi
if [[ $4 == *[,]* ]]; then
  IFS=',' read -r -a hosts <<< "$4"
elif [[ $4 == *"/"* ]]; then
  IFS=$'\n' read -d '' -r -a hosts < $4
else
  usage
fi
#printf '%s\n' "${hosts[@]}"
#sshpass -p $2 ssh  -o "StrictHostKeyChecking no" $1@$3 "echo $2 | sudo -S $4"
for h in "${hosts[@]}"
do
  sshpass -p $2 ssh  -o "StrictHostKeyChecking no" $1@$h "echo $2 | sudo -S $3"
done