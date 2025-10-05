#!/bin/bash

if [ "$ACCEPT_TERMS" != "true" ]; then
  echo "You must accept Mysterium Node Terms and Conditions to run this add-on."
  exit 1
fi

echo "Starting Myst Node..."

myst --data-dir /data/mysterium-node --config-dir /data/mysterium-node service --agreed-terms-and-conditions
