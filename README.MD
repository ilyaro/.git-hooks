# Git Pre-commit Secret Scanner on all local git repos

Scans commits for secrets using TruffleHog.

## Setup

Install TruffleHog:

 ```bash
# Install TruffleHog
 brew install trufflehog
```

# Run the deployment script:

```bash
 ./deploy-script.sh
```

## Usage

Runs automatically on every `git commit`. Blocks commits containing secrets.
