#!/bin/bash
set -e
# Description: Create a taxonomy term to tags vocabulary.

# Change the followings to match your Drupal setup:
    server="http://localhost/thb"
    username="admin"
    password="x"

# Create Article node.
    CONTENT=$(cat <<EOF
{
  "_links": {
    "type": {
      "href": "${server}/rest/type/taxonomy_term/tags"
    }
  },
  "vid": [
    {
      "target_id": "tags"
    }
  ],
  "name": [
    {
      "value": "RESTtag",
      "lang": "en"
    }
  ]
}

EOF
)


    CONTENT=$(cat <<EOF
{
  "_links": {
    "type": {
      "href": "${server}/rest/type/taxonomy_term/tags"
    },
    "${server}/rest/relation/taxonomy_term/tags/parent": [
      {
        "href": "${server}/taxonomy/term/7?_format=hal_json"
      }
    ]
  },
  "vid": [
    {
      "target_id": "tags"
    }
  ],
  "name": [
    {
      "value": "RESTtag",
      "lang": "en"
    }
  ],
}
EOF
)

    curl --user admin:x --request POST \
          --header 'Content-type: application/hal+json' \
          ${server}/entity/taxonomy_term/?_format=hal_json \
          --data-binary "${CONTENT}"
      
