#!/bin/bash
apt update

echo "########################################"
echo "Installing npm, nodejs, net-tools"
echo "########################################"

apt install -y npm nodejs net-tools
sleep 5
i=0
while [[ $i<=5 ]]
do
    echo -n "**"
    i=$((i+1))
done
sleep 5
echo "#######################################"

npm_version=$(npm --version)
echo "NPM Version $npm_version is installed"

echo "######################################"

node_version=$(nodejs --version)
echo "NodeJS version $node_version is installed"
echo "######################################"

if [[ ! -d "package" ]]
then
    if [[ ! -f bootcamp-node-envvars-project-1.0.0.tgz ]] 
    then
        wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
    fi
    tar zxvf bootcamp-node-envvars-project-1.0.0.tgz
fi

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package
npm install
node server.js

#ps -aux | grep node | grep -v grep
#sudo netstat -anlp | grep ":3000"
