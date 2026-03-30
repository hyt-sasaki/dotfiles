export GITHUB_TOKEN=$(gh auth token)
export PATH="$HOME/.local/bin:$PATH"

# Takumi Guard: supply chain protection for PyPI and npm
export PIP_INDEX_URL="https://pypi.flatt.tech/simple/"
export UV_INDEX_URL="https://pypi.flatt.tech/simple/"
export NPM_CONFIG_REGISTRY="https://npm.flatt.tech/"

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script

# safe-chain CA bundle: システムCA + safe-chain CA を結合
# safe-chain の CA cert は1日有効期限で自動再生成されるため、
# シェル起動時に ca-cert.pem が ca-bundle.pem より新しければ再生成する
() {
  local cert="$HOME/.safe-chain/certs/ca-cert.pem"
  local bundle="$HOME/.safe-chain/certs/ca-bundle.pem"
  [ -f "$cert" ] || return
  if [ ! -f "$bundle" ] || [ "$cert" -nt "$bundle" ]; then
    cat /etc/ssl/cert.pem "$cert" > "$bundle" 2>/dev/null
  fi
}
