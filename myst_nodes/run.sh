#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

ACCEPT_TERMS_AND_CONDITIONS=$(jq -r '.accept_terms_and_conditions // false' "$CONFIG_PATH")

echo "Accept Terms and Conditions: $ACCEPT_TERMS_AND_CONDITIONS"

if [ "$ACCEPT_TERMS_AND_CONDITIONS" != "true" ]; then
    echo "You must accept the Mysterium Nodes Terms and Conditions to run this add-on by navigating to the add-on configuration tab and enabling the 'accept_terms_and_conditions' option."
    exit 0
fi

echo "Starting Myst Node..."

myst --data-dir /data/mysterium-node --config-dir /data/mysterium-node service --agreed-terms-and-conditions
