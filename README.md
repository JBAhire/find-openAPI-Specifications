# OpenAPI Spec Finder GitHub Action

This action searches a GitHub repository for OpenAPI (also known as Swagger) specification files. It supports both OpenAPI 3.x.x and Swagger 2.0 specifications found in JSON and YAML formats.

The action will recursively search through all directories of the provided repository by default. However, a specific directory within the repository can be provided to narrow the search.

## Inputs

### `repository`

**Optional** The URL of the GitHub repository to search, if it's differnt than your current repository. 

### `search-dir`

Optional. The directory within the repository to search. If not provided, the action will search the entire repository.

## Usage

To use this action in a workflow, first set up the workflow to run on a specific event (like `push`), and then define the steps the workflow should take. One of those steps should be using this action.

Here is an example workflow that uses this action:

```yaml
name: OpenAPI Spec Finder

on:
  push:
    branches:
      - main

jobs:
  find-specs:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run OpenAPI Spec Finder
        uses: ./.github/actions/openapi-spec-finder
        with:
          repository: 'https://github.com/your-repo' #Optional (By default searches the checked out repository)
          search-dir: '/path/to/search'  # Optional
```

Replace 'https://github.com/your-repo' with the URL of the repository you want to search, and '/path/to/search' with the directory you want to search within the repository. If you want to search the entire repository, you can omit the search-dir input.

This action will output the paths of any OpenAPI spec files it finds to the console. 
