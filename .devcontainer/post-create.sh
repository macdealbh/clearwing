#!/usr/bin/env bash
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

uv sync --all-extras

# Optional browser tooling used by Clearwing's browser extras.
uv run python -m playwright install --with-deps chromium || true

echo "✅ Clearwing Codespaces setup complete."
echo "Next: uv run clearwing doctor"
