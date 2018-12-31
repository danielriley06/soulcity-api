#!/bin/sh
set -e

# Start the web server
echo "Staring web server..."
rm -f tmp/pids/server.pid
bundle exec puma
echo "Web server started."