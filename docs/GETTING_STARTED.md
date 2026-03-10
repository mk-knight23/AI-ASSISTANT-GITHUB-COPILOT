# Getting Started with GitHub Copilot

## What is GitHub Copilot?

GitHub Copilot is Microsoft/GitHub's AI pair programmer. Since February 2026 it includes full Agent Mode in VS Code 1.110+.

**Pricing:** Free (2,000 completions/mo) | $10/mo Individual | $19/mo Business | $39/mo Enterprise

---

## Install

### VS Code
```
Extensions (Ctrl+Shift+X) → "GitHub Copilot" → Install
Also install: "GitHub Copilot Chat"
```

### CLI
```bash
npm install -g @githubnext/github-copilot-cli
gh auth login
```

---

## Activate

```
Ctrl+Shift+P → "GitHub Copilot: Sign in"
```

Bottom status bar shows Copilot icon (✓ active).

---

## Enable Agent Mode

**This is the most important step.**

```
1. Open Chat (Ctrl+Shift+I)
2. Change dropdown from "Chat" to "Agent"
3. Set Reasoning to "HIGH" ← CRITICAL
```

```json
// .vscode/settings.json
{
  "github.copilot.chat.agent.thinkingBudget": "high"
}
```

---

## Set Up Instructions File

```bash
mkdir .github
cat > .github/copilot-instructions.md << 'EOF'
# Project Instructions

## Tech Stack
- Node.js 20 + TypeScript strict
- Express.js + PostgreSQL + Drizzle ORM
- Vitest + Supertest for testing

## Standards
- No any types
- Test every endpoint
- Parameterized queries only
- Conventional commits

## Commands
- npm run dev → development
- npm test → all tests
EOF
```

---

## Built-in Skills

In Chat panel (`Ctrl+Shift+I`):

| Skill | What it does |
|-------|-------------|
| `/tests` | Generate test suite |
| `/explain` | Explain code |
| `/fix` | Debug and fix |
| `/doc` | Generate docs |
| `/review` | Quality review |
| `/new` | Scaffold file/project |

**Example:**
```
Select function → Ctrl+Shift+I → /review
→ Gets detailed quality analysis
```

---

## First Agent Task

```
Ctrl+Shift+I → Select "Agent" mode → Reasoning: HIGH

"Add rate limiting to all API endpoints:
- 100 req/15min per IP
- 1000 req/hour per authenticated user
- Redis for distributed state
- Custom error with Retry-After header
- Full test coverage"
```

---

## Enable BugBot

```
GitHub repo → Settings → GitHub Copilot → Enable
```

Every PR gets auto-reviewed + Autofix PRs for bugs found.

---

## /fork — Branch Your Session

```
/fork → Explore alternative approach
Compare results, keep the best
```

---

## Copilot CLI

```bash
# Explain any bash command
gh copilot explain "awk '{print $2}' file | sort | uniq -c"

# Generate a command from description
gh copilot suggest "find all files >100MB, delete oldest 10"
```

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Tab` | Accept completion |
| `Ctrl+→` | Accept word |
| `Alt+]` | Next suggestion |
| `Ctrl+Shift+I` | Copilot Chat |
| `Esc` | Dismiss |

---

## Next Steps

- Read [FEATURES.md](FEATURES.md) — all features
- Read [WORKFLOWS.md](WORKFLOWS.md) — real workflows
- Set up `.github/copilot-instructions.md`
- Enable BugBot on your repo
