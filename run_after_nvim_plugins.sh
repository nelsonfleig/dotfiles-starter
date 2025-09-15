#!/bin/bash

# Install plugins in headless mode for faster startup
nvim --headless "+Lazy! sync" -c "TSUpdateSync" +qa
