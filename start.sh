#!/bin/bash

rm -f /opt/app/tmp/pids/server.pid && \
rails server -b 0.0.0.0