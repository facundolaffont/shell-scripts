#!/bin/bash

for command in $@
do
    if [[ -z $(type -t $command) ]]
    then
        echo "$command"
        exit 1
    fi
done