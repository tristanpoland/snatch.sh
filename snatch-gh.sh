#!/bin/bash

# GitHub organization name
ORG_NAME="YourOrgNameHere"

# GitHub API endpoint for the organization's repositories
API_URL="https://api.github.com/orgs/$ORG_NAME/repos"

# Directory to store the repositories
REPOS_DIR="${ORG_NAME}_repos"

# GitHub Personal Access Token (replace with your token)
# To use this, uncomment the line below and add your token
# GITHUB_TOKEN="your_personal_access_token_here"

# Create a directory to store the repositories
mkdir -p "$REPOS_DIR"
cd "$REPOS_DIR"

# Function to handle pagination
fetch_repos() {
    local page=$1
    local auth_header=""
    
    # If GITHUB_TOKEN is set, use it for authentication
    if [ -n "$GITHUB_TOKEN" ]; then
        auth_header="Authorization: token $GITHUB_TOKEN"
    fi
    
    curl -s -H "$auth_header" "${API_URL}?page=$page&per_page=100" | jq -r '.[] | .clone_url'
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
