#!/bin/bash
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

set -e
# Exit on fail

if psql -lqt | cut -d \| -f 1 | grep -qw <db_name>; then
    # database exists
    # $? is 0
else
    # ruh-roh
    # $? is 1
fi

exec "$@"