# Git Pre-commit Secret Scanner on all local git repos

Scans commits for secrets using TruffleHog.

## Setup

```bash
# Install TruffleHog
brew install trufflehog

# Create hooks directory
mkdir -p ~/.git-hooks

# Create pre-commit hook
cat > ~/.git-hooks/pre-commit << 'EOF'
#!/bin/bash
trufflehog filesystem --no-update . --fail
EOF

# Make it executable
chmod +x ~/.git-hooks/pre-commit

# set pre-commit to run on commit in all repos
git config --global core.hooksPath ~/.git-hooks
```

## Usage

Runs automatically on every `git commit`. Blocks commits containing secrets.
