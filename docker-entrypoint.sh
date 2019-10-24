#!/bin/sh
set -e

# Setup cargo
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.bashrc

# Keep the container running so we can exec into it after
# TODO: Maybe add env flag to toggle this in the future
tail -f /dev/null
