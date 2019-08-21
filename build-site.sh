#!/usr/bin/env bash
# ==============================================================================
# Community Hass.io Add-ons for Home Assistant
# This script builds a small little website
# ==============================================================================
set -o errexit  # Exit script when a command exits with non-zero status
set -o errtrace # Exit on error inside any functions or sub-shells
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

# Switch to the root of the repository.
cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")"

# Create a documentation folder
mkdir -p docs

# Install requirements
pip install -r requirements.txt

# Download Edge page
curl https://raw.githubusercontent.com/hassio-addons/repository-edge/master/README.md --output docs/edge.md

# Get the pages into the docs folder
ln -sf ../README.md docs/index.md
ln -sf ../LICENSE.md docs/license.md
ln -sf ../CONTRIBUTING.md docs/contributing.md
ln -sf ../CODE_OF_CONDUCT.md docs/code-of-conduct.md

# Build!
mkdocs build
