#!/bin/bash

HEALTHCHECK_URL="http://whoami.localhost:8080/"
TIME_TO_SLEEP=0.1

while true; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}\n" $HEALTHCHECK_URL)
  if [ $STATUS -eq 200 ]; then
    gum log -t datetime -l info "$STATUS"
  else
    gum log -t datetime -l error "$STATUS"
  fi
  sleep $TIME_TO_SLEEP
done
