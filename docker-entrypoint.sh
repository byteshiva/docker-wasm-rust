#!/bin/sh
set -e

# Check if project directory exists and is empty. If it is, temporarily remove
# it and generate a new project

generate=false

if [ -d "/root/project" ]; then
  if [ "$(ls -1qA /root/project | grep .)" = "" ]; then
      generate=true
  fi
else
  generate=true
fi

if [ "$generate" = "true" ]; then
  cd /root/project && \
  cargo generate --git https://github.com/rustwasm/wasm-pack-template -n $PROJECT_NAME -f
fi

# Keep the container running so we can exec into it after
# TODO: Maybe add env flag to toggle this in the future
tail -f /dev/null
