#!/bin/bash

#specify github url repostiory
github_api="https://api.github.com"
REPO="Jenkins-Zero-To-Hero"
#https://github.com/malle392/Jenkins-Zero-To-Hero.git
#specify username
username="malle392"
OWNER=$username
#token
response=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  $github_api/repos/$OWNER/$REPO/branches)

  # Check if branches found
    if [[ $(echo "$response" | jq -r '.[].message') == "Not found" ]]; then
    echo "Branches not found"
    fi
# Display branches
  branch=$(echo "$response" | jq -r '.[].name')
  echo "$branch"
