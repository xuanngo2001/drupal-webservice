#!/bin/bash
set -e
# Description: Get node content.

# Change the followings to match your Drupal setup:
    server="http://localhost/thb"
    username="admin"
    password="x"

# Get the content of node ID.
    node_id=1
    #curl --user admin:x --header 'Accept: application/hal+json' --request GET ${server}/node/${node_id}?_format=hal_json
    curl --user admin:x --header 'Accept: application/hal+json' --request GET ${server}/entity/taxonomy_term/${node_id}?_format=hal_json


exit
taxonomy_term/tags