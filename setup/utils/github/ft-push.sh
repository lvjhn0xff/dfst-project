#!/bin/bash 

source setup/activate

REPO_PATH=${PROJECT_GITHUB_USERNAME}/${PROJECT_GITHUB_REPOSITORY}.git

# Initialize Git in project.
git init --initial-branch=main

# Add all files.
git add .

# Make commit messages.
git commit -m "initial commit" 

# Add remote repository.
git remote add origin git@github.com:${REPO_PATH} 

# Set upstream branch.
git push --set-upstream --force origin main