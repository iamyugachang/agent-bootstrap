#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}[+]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[x]${NC} $*"; exit 1; }

info "agent-bootstrap setup starting"
echo

# -- 1. Check Hermes -------------------------------------------------------
if ! command -v hermes &>/dev/null; then
  warn "hermes not found — install it from https://hermes-agent.nousresearch.com/"
  warn "Continuing to set up MCP deps anyway."
else
  HERMES_VERSION=$(hermes --version 2>/dev/null || echo "unknown")
  info "Hermes found: $HERMES_VERSION"
fi

# -- 2. Check Node.js ------------------------------------------------------
if ! command -v node &>/dev/null; then
  error "Node.js not found. Install Node 18+ first: https://nodejs.org"
fi
NODE_VERSION=$(node --version)
info "Node.js found: $NODE_VERSION"

# -- 3. Pre-fetch MCP server packages (so first run is instant) ------------
info "Pre-fetching MCP server packages via npx..."

MCP_SERVERS=(
  "@modelcontextprotocol/server-github"
  "@modelcontextprotocol/server-filesystem"
  "@modelcontextprotocol/server-fetch"
  "@modelcontextprotocol/server-brave-search"
  "@modelcontextprotocol/server-memory"
  "@modelcontextprotocol/server-sequential-thinking"
)

for pkg in "${MCP_SERVERS[@]}"; do
  info "  caching $pkg"
  npx --yes "$pkg" --help &>/dev/null || true
done

# -- 4. Config setup -------------------------------------------------------
CONFIG_DIR="$HOME/.hermes"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_DIR/config.yaml" ]; then
  info "No config.yaml found — copying template"
  cp config/config.yaml "$CONFIG_DIR/config.yaml"
  warn "Edit $CONFIG_DIR/config.yaml and fill in your API keys!"
else
  info "config.yaml already exists — skipping (check config/config.yaml for reference)"
fi

echo
info "Setup complete!"
echo
echo "Next steps:"
echo "  1. Edit ~/.hermes/config.yaml — add your GITHUB_PERSONAL_ACCESS_TOKEN"
echo "  2. Optionally add BRAVE_API_KEY for web search (free at https://api.search.brave.com/)"
echo "  3. Run: hermes"
echo "  4. Read QUICKSTART.md for the first commands to try"
