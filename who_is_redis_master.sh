#!/bin/bash
# You could find who is your redis master from a list of redis instance

# Set your redis machine list by <host>:<ip>. Separate by space
redis_machines=()

keyword=$1
NEWLINE=$'\n'

for redis in ${redis_machines[@]}; do
        IFS=':' read -a redis_setting <<< "$redis"
        role=$(redis-cli -h ${redis_setting[0]} -p ${redis_setting[1]} INFO | grep $keyword)
        echo "$redis - $role"
done
