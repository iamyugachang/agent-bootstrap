# MCP Server Catalog

These are the MCP servers set up by this bootstrap. All run via `npx -y` so no global install is needed.

## github

Source: `@modelcontextprotocol/server-github`

Capabilities:
- Create / list / fork repositories
- Create and merge pull requests
- Create and manage issues
- Read file contents, search code
- Push files, create branches

Setup:
1. Go to https://github.com/settings/tokens
2. Create a PAT with repo + read:org scopes
3. Set `GITHUB_PERSONAL_ACCESS_TOKEN` in config.yaml

## filesystem

Source: `@modelcontextprotocol/server-filesystem`

Capabilities:
- Read, write, create, delete files
- List directories
- Move and search files

Setup: No API key. Pass allowed directories as args:
```yaml
args: ["-y", "@modelcontextprotocol/server-filesystem", "/home/you", "/tmp"]
```

## fetch

Source: `@modelcontextprotocol/server-fetch`

Capabilities:
- Fetch any public URL and return clean markdown
- Useful for reading docs, blog posts, API references

Setup: No API key needed.

## brave-search

Source: `@modelcontextprotocol/server-brave-search`

Capabilities:
- Web search via Brave Search API
- Returns titles, URLs, and snippets

Setup:
1. Sign up at https://api.search.brave.com/
2. Free tier: 2000 requests/month
3. Set `BRAVE_API_KEY` in config.yaml

## memory

Source: `@modelcontextprotocol/server-memory`

Capabilities:
- Store and retrieve key-value pairs that persist across sessions
- Good for project-specific facts, preferences, recurring context

Setup: No API key. Data stored locally in `~/.mcp-memory/`.

## sequential-thinking

Source: `@modelcontextprotocol/server-sequential-thinking`

Capabilities:
- Forces the agent to break complex problems into explicit numbered steps
- Useful for debugging, planning, and multi-step reasoning tasks
- Each step is revisable — the agent can backtrack

Setup: No API key needed.

---

## Other useful MCP servers (not in default setup)

| Server | Purpose |
|--------|---------|
| `@modelcontextprotocol/server-postgres` | Query a PostgreSQL database |
| `@modelcontextprotocol/server-sqlite` | Query a local SQLite file |
| `@modelcontextprotocol/server-slack` | Post to Slack, read channels |
| `@modelcontextprotocol/server-google-maps` | Geocoding, directions, places |
| `mcp-server-docker` | Manage Docker containers |
| `mcp-server-kubernetes` | kubectl via MCP |

Full list: https://github.com/modelcontextprotocol/servers
