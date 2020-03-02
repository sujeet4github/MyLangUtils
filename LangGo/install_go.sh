#!/bin/bash

# If you are upgrading from an older version of Go you must first remove the existing version.

wget -c https://dl.google.com/go/go1.14.linux-amd64.tar.gz

shasum -a 256 go*.tar.gz | awk '$1=="08df79b46b0adf498ea9f320a0f23d6ec59e9003660b4c9c1ce8e5e2c6f823ca" { print "SHA sum matches, good to go" }'

mv go*.tar.gz /tmp

sudo tar -C /usr/local/bin -xzf /tmp/go1.14.linux-amd64.tar.gz
