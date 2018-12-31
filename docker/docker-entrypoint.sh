#!/bin/sh
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

set -e
# Exit on fail

if psql -lqt | cut -d \| -f 1 | grep -qw "soulcity-api_development"; then
    echo "fuckkkkkk"
else
    echo "yayyyyyyyy"
fi

exec "$@"