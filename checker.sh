#!/bin/bash

function check {
  ping -w 1 -c 5 -q 8.8.8.8 
  status=$?
  
  if [[ $status == 1 ]]; then
    echo "Connection Alive"
  else
    echo "Connection Dead. Switching the modem off"
    gpio -g write 4 0
    sleep 10
    gpio -g write 4 1
    echo "Switching the modem on"
  fi
}

check | awk -v date="$(date +'%Y-%m-%d %r')" '{ print date, $0}' >> /tmp/checker.log
