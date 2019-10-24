#!/bin/sh
set -e

# Run nginx
service nginx start

# Keep the container running so we can exec into it after
# TODO: Maybe add env flag to toggle this in the future
tail -f /dev/null
