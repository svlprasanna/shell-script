#!/bin/bash

number=$1

if [ $number -gt 100 ]
then
    echo "entered number is greater than 100"
else
    echo "entered number is smaller than 100"
fi