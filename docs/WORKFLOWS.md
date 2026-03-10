# GitHub Copilot — Workflows

Real-world workflows using Copilot Agent Mode + Skills.

---

## Workflow 1: Feature Development (Agent Mode)

**Prerequisites:** Agent mode active, Reasoning set to HIGH

```
Ctrl+Shift+I → Agent mode

"Build a user notification system:
- Notification model in database
- REST API: create, list, mark-read, clear-all
- Real-time delivery via Server-Sent Events
- React hook: useNotifications()
- Notification bell component with badge
- Tests for API and hooks

Use existing patterns from @workspace"
```

Watch the agent:
1. Read your codebase
2. Create database migration
3. Implement API endpoints
4. Create frontend components
5. Write tests
6. Run tests and fix failures

---

## Workflow 2: Bug Fix with Context

```
1. Open the buggy file
2. Select the problematic code
3. Ctrl+Shift+I:

"/fix
The calculateDiscount function returns wrong values for
orders with multiple coupon codes. Expected: coupons should
stack multiplicatively. Current: they add additively.

Here's a failing test case: [paste test]"
```

---

## Workflow 3: Security Audit

```
Ctrl+Shift+I → Agent mode:

"Security audit of this entire codebase:
1. Check all SQL queries for injection risks
2. Review authentication and authorization
3. Check for XSS vulnerabilities in templates
4. Look for exposed secrets or API keys
5. Review CORS and CSP headers
6. Check dependency vulnerabilities

Output: security-report.md with Risk/Medium/Low labels
and specific fix recommendations"
```

---

## Workflow 4: /fork for Architecture Decision

```
Start with: "Add caching to our API"

/fork option-A → "Redis cluster caching"
Implement and analyze cost/complexity

/fork option-B → "In-memory LRU cache"
Implement and analyze tradeoffs

/fork option-C → "CDN edge caching"
Implement and analyze tradeoffs

→ Compare all three
→ Pick the best or merge approaches
```

---

## Workflow 5: PR Review Pipeline

**Automatic with BugBot:**
- Every PR → Copilot posts review comments
- Security issues flagged immediately
- Logic bugs highlighted
- Autofix button creates fix PRs

**Manual review:**
```
Ctrl+Shift+I:
"/review
Review the PR diff I have staged:
- Logic correctness
- Security vulnerabilities
- Missing tests
- Performance issues
- Edge cases not handled"
```

---

## Workflow 6: Generate Full Test Suite

```
Select a file → Ctrl+Shift+I:
"/tests
Generate a comprehensive test suite for this module:
- Happy path for each function
- Edge cases (empty, null, max values)
- Error scenarios
- Integration tests for API calls
- Mock strategies for dependencies

Framework: Jest + ts-jest"
```

---

## Workflow 7: Documentation Sprint

```
Agent mode:
"Generate complete project documentation:
1. /doc for every exported function (JSDoc)
2. README.md with setup, usage, API reference
3. ARCHITECTURE.md with system overview diagram
4. CONTRIBUTING.md with dev workflow
5. CHANGELOG.md from git history

Save all files to docs/"
```

---

## Workflow 8: Dependency Migration

```
Agent mode:
"Migrate from Moment.js to date-fns:
1. audit all moment.js usage (@workspace)
2. Map each API to date-fns equivalent
3. Update all imports and function calls
4. Add date-fns to package.json
5. Remove moment.js
6. Update and run tests

Show migration summary when complete"
```

---

## Workflow 9: Copilot CLI in Terminal

```bash
# During active development - get command suggestions
gh copilot suggest "compress all images in public/ folder,
keeping originals in public/original/"

# Explain complex commands before running
gh copilot explain "find . -name '*.log' -mtime +30 -delete"

# Git operations made safe
gh copilot suggest "undo my last commit but keep all file changes"
```

---

## Quick Reference

| Skill | Best For |
|-------|---------|
| `/tests` | Generate test coverage |
| `/fix` | Debug specific code |
| `/explain` | Understand complex code |
| `/doc` | Generate documentation |
| `/review` | Pre-commit code review |
| `/fork` | Compare approaches |
| Agent Mode | Full feature implementation |
| CLI `suggest` | Terminal command help |
