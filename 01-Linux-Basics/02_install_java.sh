#!/bin/bash
function installation_needed() {
  java_version=$(java -version 2>&1 > /dev/null | egrep "java version|openjdk" | awk '{print $3}')
  java_version_short=$(java -version 2>&1 > /dev/null | egrep "java version|openjdk" | awk -F '"' '{print $2}' | awk -F '.' '{print $1}')

  if [ "$java_version" == ""  ]
    then
      echo "java installation is required!"
      return 1
  elif [ "$java_version_short" -ge 11 ]
    then
      echo "java version $java_version found!"
      return 0
  elif [ "$java_version_short" -l 11 ]
    then
      echo "Older java version $java_version found."
      return 1
  fi
}

function check_installation() {
    installation_needed
    if [ $? == 0 ]
      then
        echo "The new java version >= 11 was already installed"
    else
        echo "Java version >= 11 could not be installed"
    fi  
}

function install_java() {
    echo "installing current jdk......"
    sudo apt update
    sudo apt install -y default-jre
}

function main() {
    installation_needed
    if [ $? == 1 ]
      then
        install_java
        check_installation
    else
      echo "Java with version greater than or equal to 11 is already installed!"
    fi
}
main
