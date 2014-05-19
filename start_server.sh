#!/usr/bin/env bash

PID_8080="pserve_8080.pid"
PID_8081="pserve_8081.pid"

# Stop the waitress servers
../bin/pserve --stop-daemon --pid-file=$PID_8080
../bin/pserve --stop-daemon --pid-file=$PID_8081

# Start the waitress servers
../bin/pserve --daemon --pid-file=$PID_8080 production.ini http_port=8080
../bin/pserve --daemon --pid-file=$PID_8081 production.ini http_port=8081

# Restart nginx
sudo service nginx stop
sudo service nginx start
