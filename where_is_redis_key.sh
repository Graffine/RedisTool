#!/bin/bash
# You could find where is your redis key if you distributed your redis key by hashing

# Set your redis machine list by <host>:<ip>. Separate by space
redis_machines=()

key=$1
NEWLINE=$'\n'

for redis in ${redis_machines[@]}; do
        IFS=':' read -a redis_setting <<< "$redis"
        role=$(redis-cli -h ${redis_setting[0]} -p ${redis_setting[1]} TYPE $key)
        echo "$redis - $role"
done

