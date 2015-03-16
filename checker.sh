#!/bin/bash

source env.conf

function pin {
  curl -s -o /dev/null -XPOST http://$USER:$PASSWORD@localhost:8000/GPIO/$1/function/$2
}

function modem_on {
  pin $PIN IN
}

function modem_off {
  pin $PIN OUT
}

function check {
  ping -w 5 -c 5 -q 8.8.8.8
  status=$?
  
  if [[ $status == 0 ]]; then
    echo "Connection Alive"
  else
    echo "Connection Dead. Switching the modem off"
    modem_off
    sleep $TIMEOUT
    modem_on
    echo "Switching the modem on"
  fi
}

check | awk -v date="$(date +'%Y-%m-%d %r')" '{ print date, $0}' >> /var/log/checker/checker.log
