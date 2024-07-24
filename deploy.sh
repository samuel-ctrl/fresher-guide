#!/bin/bash

# Install MkDocs and the Material theme
pip install mkdocs

# Install http-server globally using npm
npm install -g http-server

# Build the MkDocs site
mkdocs build

# Start http-server to serve the site (optional, for local preview)
http-server
