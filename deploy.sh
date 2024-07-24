#!/bin/bash

# Install MkDocs and the Material theme
pip install mkdocs

# Install http-server globally using npm
echo "Installing Node dependencies..."
npm install -g http-server
echo "Instaled Node dependencies..."

# Build the MkDocs site
mkdocs build

# Start http-server to serve the site (optional, for local preview)
http-server
