#!/bin/bash

repository=$1
search_dir=$2

# Go to the repository root or the specified directory
if [ -z "$repository" ]; then
  if [ -z "$search_dir" ]; then
    cd $GITHUB_WORKSPACE
  else
    cd $GITHUB_WORKSPACE/$search_dir
  fi
else
  # Clone the repository
  git clone $repository /tmp/repo

  if [ -z "$search_dir" ]; then
    cd /tmp/repo
  else
    cd /tmp/repo/$search_dir
  fi
fi

# Search for OpenAPI 3.x.x specifications
spec_files=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) -print0 | xargs -0 grep -l "openapi: 3")

# Search for Swagger 2.0 specifications
spec_files+=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) -print0 | xargs -0 grep -l "swagger: \"2.0\"")

echo "::set-output name=spec_files::$spec_files"
