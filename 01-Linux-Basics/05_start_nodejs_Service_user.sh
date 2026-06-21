#!/bin/bash
apt update
NEW_USER=myapp

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

read -p "Set log directory location for application (absolute path):" LOG_DIRECTORY

if [[ -d "$LOG_DIRECTORY" ]]
then
    echo "$LOG_DIRECTORY already exits"    
else
    mkdir -p $LOG_DIRECTORY
    echo "A new directory $LOG_DIRECTORY created successfully"
fi

useradd $NEW_USER -m
chown $NEW_USER -R $LOG_DIRECTORY
runuser -l $NEW_USER -c "
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz &&
tar zxvf bootcamp-node-envvars-project-1.0.0.tgz"

runuser -l $NEW_USER -c "
export APP_ENV=dev &&
export DB_USER=myuser &&
export DB_PWD=mysecret &&
export LOG_DIR=$LOG_DIRECTORY &&
cd package &&
npm install &&
node server.js "

ps -aux | grep node | grep -v grep
sudo netstat -anlp | grep ":3000"
