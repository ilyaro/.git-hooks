#!/bin/bash

# Directory where global git hooks will be stored
HOOKS_DIR="$HOME/.git-hooks"
# Directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Track if installation/update is needed
installing=0

# Create hooks directory if it doesn't exist
if [ ! -d "$HOOKS_DIR" ]; then
    echo "Creating hooks directory at $HOOKS_DIR"
    mkdir -p "$HOOKS_DIR"
    installing=1
fi

# Copy pre-commit hook if it has changed
if ! diff -q "$SCRIPT_DIR/pre-commit" "$HOOKS_DIR/pre-commit" >/dev/null 2>&1; then
    cp "$SCRIPT_DIR/pre-commit" "$HOOKS_DIR/pre-commit"
    chmod +x "$HOOKS_DIR/pre-commit"
    echo "Copied $SCRIPT_DIR/pre-commit to $HOOKS_DIR/pre-commit and made it executable"
    installing=1
fi

# Configure git to use the global hooks directory
if [ "$(git config --global core.hooksPath)" = "$HOOKS_DIR" ]; then
    echo "Already installed with same config. Skipping."
else 
    git config --global core.hooksPath "$HOOKS_DIR"
    echo "git config --global core.hooksPath \"$HOOKS_DIR\""
    installing=1
fi

# Display appropriate completion message
if [ $installing -eq 1 ]; then
    echo "Installation complete. Git hooks are now set up."
else
    echo "No changes made. Git hooks are already up to date."
fi