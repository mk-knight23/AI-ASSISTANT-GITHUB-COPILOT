# GitHub Copilot — Features Deep Dive

> GitHub Copilot — AI pair programmer integrated into VS Code, JetBrains, and more. 60M+ code reviews.

## Agent Mode (February 2026)

The biggest Copilot evolution: **Agent Mode** went GA in VS Code 1.110 (February 2026).

```
Before (Copilot Chat):     After (Agent Mode):
   You ask question     →    Copilot plans + executes
   Copilot answers      →    Reads files autonomously
   You implement        →    Writes code + tests
                        →    Runs commands
                        →    Iterates until done
```

---

## Feature 1: Agent Mode

Full autonomous development in VS Code:

- Activated in Chat panel: switch to "Agent" mode
- Reads your entire workspace
- Plans multi-step implementation
- Executes terminal commands
- Runs tests and fixes failures
- Continues until task complete

**Critical Setting:** Set Reasoning to **HIGH** for best agent performance.

```json
// .vscode/settings.json
{
  "github.copilot.chat.agent.thinkingBudget": "high"
}
```

---

## Feature 2: Built-in Skills (Slash Commands)

Copilot's built-in expert skills:

| Skill | Command | What it does |
|-------|---------|-------------|
| Tests | `/tests` | Generate comprehensive test suite |
| Explain | `/explain` | Detailed code explanation |
| Fix | `/fix` | Debug and fix selected code |
| Review | `/review` | Code quality review |
| Doc | `/doc` | Generate documentation |
| New | `/new` | Scaffold new project/file |
| Terminal Fix | `/fix` (in terminal) | Fix failed commands |

**Example:**
```
Select function → /review
# Copilot analyzes for:
# - Logic errors
# - Security vulnerabilities
# - Performance issues
# - Missing edge cases
```

---

## Feature 3: Lifecycle Hooks

Hook into Copilot's workflow at key points:

```python
# .github/copilot-instructions.md
# Define hooks that fire during agent execution:

## Pre-commit Hook
Before committing: always run `npm test`

## Pre-push Hook
Before pushing: run `npm run lint && npm run build`

## Post-create Hook
After creating a new file: add it to the test suite
```

---

## Feature 4: Agent Memory

Copilot agents remember context within and across sessions:

- **Session Memory:** Remembers your conversation context
- **Workspace Memory:** Project structure, coding patterns
- **Instruction Override:** `.github/copilot-instructions.md`

**`/compact`** — Prunes conversation to keep within context window while retaining key information.

---

## Feature 5: Integrated Browser

Agent mode has a built-in browser:

- Navigate to URLs to gather documentation
- Screenshot web pages as context
- Test web UIs interactively
- Fill forms, click buttons, verify behavior
- Fetch and parse API documentation

**Use case:**
```
"Look at our staging URL: https://staging.myapp.com/login
Take a screenshot of the login form
Then fix the validation error shown on screen"
```

---

## Feature 6: /fork — Session Branching

Branch your conversation to explore alternatives:

```
Main session: "Implement payments with Stripe"
    ├── /fork → "Alternative: Implement with PayPal"
    └── /fork → "Alternative: Implement with Braintree"

# Compare all three approaches
# Merge best elements from each branch
```

---

## Feature 7: Copilot CLI

Terminal-native Copilot:

```bash
# Install
npm install -g @githubnext/github-copilot-cli

# Explain a command
gh copilot explain "curl -X POST -H 'Content-Type: application/json' ..."

# Suggest a command
gh copilot suggest "find all files modified today, gzip them, upload to S3"

# Git operations
gh copilot suggest "undo last commit but keep the changes"
```

---

## Feature 8: BugBot Autofix

Automatic PR bug detection and fixing:

- Reviews every PR automatically
- Posts specific, actionable comments
- **Autofix button:** One click creates a fix PR
- Catches: null pointer exceptions, unhandled promises, SQL injection
- Integrates into GitHub Actions

**Enable in repo settings:**
```yaml
# .github/workflows/copilot.yml
- uses: github/copilot-autofix@v1
  with:
    categories: security,bugs,performance
```

---

## Feature 9: JetBrains Support

Full feature parity in JetBrains IDEs:
- IntelliJ IDEA, PyCharm, WebStorm, GoLand
- Same agent mode, same skills
- Alt+\ for inline suggestions
- Dedicated Copilot tool window

---

## Enterprise Features

| Feature | Description |
|---------|-------------|
| Org-level policies | Control which models and features are allowed |
| Audit logs | Full history of AI suggestions |
| Content exclusions | Block AI from reading sensitive files |
| Self-hosted models | Use your own fine-tuned models |
| Copilot for Docs | Train on your internal documentation |

---

## Model Options

```
GitHub Copilot Models (as of 2026):
├── GPT-4o (default) — Balanced speed/quality
├── Claude Sonnet 4.5 — Better code quality
├── o3-mini — Advanced reasoning
└── Custom — Your fine-tuned model (Enterprise)
```

---

## Performance Tips

1. **Always set Reasoning to HIGH** in Agent mode
2. Write detailed `.github/copilot-instructions.md`
3. Use `/compact` to extend long sessions
4. Use `/fork` to explore multiple solutions
5. BugBot on every PR — catches issues pre-merge
6. CLI for terminal operations (`gh copilot suggest`)
