#!/bin/bash
set -e
# Description: Get node content.

# Change the following to match your Drupal setup:
    server="http://example.com"
    username="admin"
    password="x"

# Get the content of node ID.
    node_id=1
    curl --user admin:x --header 'Accept: application/hal+json' --request GET ${server}/node/${node_id}?_format=hal_json
