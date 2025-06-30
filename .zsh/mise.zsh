# mise (https://mise.jdx.dev/)

# Check if mise is installed
if ! [ -x "$HOME/.local/bin/mise" ]; then
  echo "mise not found. Installing..."
  curl https://mise.run | sh
fi

# Activate mise
eval "$($HOME/.local/bin/mise activate zsh)"

# Auto-install global tools if config exists and tools are missing
if [ -f "$HOME/.config/mise/config.toml" ]; then
  if [ -n "$(mise ls --missing)" ]; then
    echo "mise: Found missing global tools. Installing..."
    mise install
  fi
fi