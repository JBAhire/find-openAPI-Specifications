#!/bin/bash

repository=$1
search_dir=$2

if [ -z "$repository" ]; then
  echo "Please provide a repository URL."
  exit 1
fi

# Clone the repository
git clone $repository /tmp/repo

# Go to the repository root or the specified directory
if [ -z "$search_dir" ]; then
  cd /tmp/repo
else
  cd /tmp/repo/$search_dir
fi

# Search for OpenAPI 3.x.x specifications
spec_files=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) -print0 | xargs -0 grep -l "openapi: 3")

# Search for Swagger 2.0 specifications
spec_files+=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) -print0 | xargs -0 grep -l "swagger: \"2.0\"")

echo $spec_files
