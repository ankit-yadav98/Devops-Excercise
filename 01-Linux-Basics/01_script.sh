#!/bin/bash
echo "bash is working"
num1=$1
num2=$2
result=0
for param in $*
do
  echo "num1= $param"
done
read -p "Enter the operation (+,-,*,/): " operand
if [ "$operand" == "+" ]
then
  result=$(( num1 + num2 ))
elif [ "$operand" == "-" ]
then
  result=$((num1 - num2))
elif [ "$operand" == "*" ]
then
  result=$((num1 * num2))
elif [ "$operand" == "/" ]
then
  result=$((num1/num2 ))
else
  echo "wrong operation"
fi
echo "$result"
