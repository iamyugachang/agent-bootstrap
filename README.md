# agent-bootstrap

Quick bootstrap for [Hermes Agent](https://hermes-agent.nousresearch.com/) — get a new agent environment ready in minutes.

Clone this repo, run the setup script, drop in your API keys, and you're ready to give orders.

## What's included

```
agent-bootstrap/
├── setup.sh                  # One-shot installer
├── config/
│   └── config.yaml           # Recommended Hermes config template
├── mcp/
│   ├── README.md             # MCP server catalog + setup notes
│   └── snippets/             # Ready-to-paste mcp_servers blocks
│       ├── github.yaml
│       ├── filesystem.yaml
│       ├── fetch.yaml
│       ├── brave-search.yaml
│       ├── memory.yaml
│       └── sequential-thinking.yaml
└── QUICKSTART.md             # First commands to try
```

## Quick start

```bash
git clone https://github.com/iamyugachang/agent-bootstrap.git
cd agent-bootstrap
bash setup.sh
```

Then open `~/.hermes/config.yaml` and fill in your API keys in the `mcp_servers` section.

See [QUICKSTART.md](./QUICKSTART.md) for the first commands to try.

## MCP servers included

| Server | Purpose | Needs key? |
|--------|---------|------------|
| `@modelcontextprotocol/server-github` | GitHub — create repos, PRs, issues | Yes (PAT) |
| `@modelcontextprotocol/server-filesystem` | Read/write local files | No |
| `@modelcontextprotocol/server-fetch` | Fetch any URL as markdown | No |
| `@modelcontextprotocol/server-brave-search` | Web search via Brave | Yes (free tier) |
| `@modelcontextprotocol/server-memory` | Persistent key-value memory across sessions | No |
| `@modelcontextprotocol/server-sequential-thinking` | Structured multi-step reasoning | No |

## Requirements

- Node.js >= 18 (for npx-based MCP servers)
- Python >= 3.10
- Hermes Agent installed
- A GitHub Personal Access Token (for the GitHub MCP)
