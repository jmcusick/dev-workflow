#!/bin/bash

# start socat proxy in background (for ssm sessions)
nohup bash -c "socat tcp-listen:5432,reuseaddr,fork tcp:localhost:5431" &

# continue onto aws
/usr/local/bin/aws "$@"
