export GITHUB_TOKEN=$(gh auth token)
export PATH="$HOME/.local/bin:$PATH"

# Takumi Guard: supply chain protection for PyPI and npm
export PIP_INDEX_URL="https://pypi.flatt.tech/simple/"
export UV_INDEX_URL="https://pypi.flatt.tech/simple/"
export NPM_CONFIG_REGISTRY="https://npm.flatt.tech/"

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
