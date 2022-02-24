#!/usr/bin/env bash

# shellcheck disable=SC2154
gold start "${service}"

trap "echo Shutting down ...; gold stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  touch "$GOLD_ROOT/log/debug.log"
  tail -F "$GOLD_ROOT/log/debug.log" &
fi

while true; do sleep 1; done
