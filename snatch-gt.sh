#!/bin/bash

# Gitea API endpoint for the organization's repositories
API_URL="https://git.example.com/api/v1/orgs/MyOrg/repos"

# Directory to store the repositories
REPOS_DIR="repo_backup"

# Create a directory to store the repositories
mkdir -p "$REPOS_DIR"
cd "$REPOS_DIR"

# Function to handle pagination
fetch_repos() {
    local page=$1
    curl -s "${API_URL}?page=$page&limit=50" | jq -r '.[] | .clone_url'
}

# Fetch and clone repositories
page=1
while true; do
    repos=$(fetch_repos $page)
    
    # Break if no more repositories
    if [ -z "$repos" ]; then
        break
    fi

    # Clone each repository
    echo "$repos" | while read -r repo_url; do
        echo "Cloning: $repo_url"
        git clone "$repo_url"
    done

    ((page++))
done

echo "All repositories have been cloned."
