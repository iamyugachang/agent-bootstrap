# Quickstart — First Commands After Bootstrap

Once setup is done, open a terminal and run `hermes`. Try these:

## Verify your setup

```
list my github repos
```

```
search the web for "latest LLM news"
```

```
read the file /etc/os-release and tell me my OS
```

## Start a real task

```
clone my repo <repo-name>, analyze the codebase, and give me a summary
```

```
create a new github repo called <name> with a README
```

```
write a plan to build <feature>, then implement it step by step
```

## Useful agent patterns

### Plan before doing
```
plan: build a FastAPI service that does X
```
This triggers the `plan` skill — writes a markdown plan first, doesn't code yet.

### Full TDD cycle
```
implement <feature> using TDD
```
Agent writes tests first (RED), then implementation (GREEN), then refactors.

### Delegate to sub-agents
```
implement the tasks in PLAN.md using parallel sub-agents
```
Uses the `subagent-driven-development` skill to run tasks in parallel.

### Code review before commit
```
review my changes in git diff and check for security issues
```

### GitHub full workflow
```
create a branch, implement <feature>, commit, open a PR with description
```

## Skills already available (all builtin)

These work out of the box — no install needed:

- **github-pr-workflow** — branch, commit, PR lifecycle
- **github-issues** — create, triage, close issues
- **writing-plans** — spec -> implementation plan
- **test-driven-development** — TDD RED-GREEN-REFACTOR
- **subagent-driven-development** — parallel task execution
- **systematic-debugging** — 4-phase root cause investigation
- **requesting-code-review** — pre-commit security + quality gate
- **codebase-inspection** — LOC counts, complexity, tech stack
- **architecture-diagram** — dark-themed SVG infra diagrams
- **arxiv** — search academic papers
- **youtube-content** — transcript -> summary/blog/thread
- **jupyter-live-kernel** — stateful Python REPL
