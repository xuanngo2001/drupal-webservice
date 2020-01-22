#!/bin/bash
set -e
# Description: Create a node.

# Change the followings to match your Drupal setup:
    server="http://localhost/thb"
    username="admin"
    password="x"

# Create Article node.
    CONTENT=$(cat <<EOF
{
    "_links": {
        "type": {
            "href": "${server}/rest/type/node/article"
        }
    },
    "title": [
        {
            "value": "Example node title"
        }
    ],
    "body": [
        {
            "value": "This is the body content of my page",
            "lang": "en"
        }
    ],            
    "type": [
        {
            "target_id": "article"
        }
    ]
}

EOF
)

    curl --user admin:x --request POST \
          --header 'Content-type: application/hal+json' \
          ${server}/entity/node?_format=hal_json \
          --data-binary "${CONTENT}"
      
