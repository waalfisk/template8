#!/bin/bash

second=$(date +%s)
echo "Hello World. ${second} seoncds since 1st Jan 1970" > "/data/msg-${second}.log"

echo "for the log file at ${second}."

#successfully done
exit 0
