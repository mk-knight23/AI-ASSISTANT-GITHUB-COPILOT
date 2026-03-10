#!/usr/bin/env bash
# =============================================================================
# GitHub Copilot Setup Script
# Sets up Copilot with Agent Mode, project instructions, BugBot workflow
# Run: chmod +x setup.sh && ./setup.sh
# =============================================================================

set -euo pipefail

BLUE='\033[0;34m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
log()  { echo -e "${BLUE}[copilot-setup]${NC} $*"; }
ok()   { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }

log "GitHub Copilot Setup"

# CLI installation
if command -v npm >/dev/null 2>&1; then
  log "Installing Copilot CLI..."
  npm install -g @githubnext/github-copilot-cli 2>/dev/null && ok "Copilot CLI installed" || \
    warn "CLI install failed - run manually: npm install -g @githubnext/github-copilot-cli"
fi

# VS Code extensions
if command -v code >/dev/null 2>&1; then
  log "Installing VS Code extensions..."
  code --install-extension GitHub.copilot 2>/dev/null && ok "GitHub.copilot" || true
  code --install-extension GitHub.copilot-chat 2>/dev/null && ok "GitHub.copilot-chat" || true
else
  warn "Install manually in VS Code: GitHub.copilot + GitHub.copilot-chat"
fi

# VS Code settings with Agent Mode HIGH
mkdir -p .vscode
if [[ ! -f .vscode/settings.json ]]; then
  cat > .vscode/settings.json << 'EOF'
{
  "github.copilot.enable": { "*": true },
  "github.copilot.chat.agent.thinkingBudget": "high",
  "github.copilot.chat.useProjectTemplates": true
}
EOF
  ok "Created .vscode/settings.json (Agent Mode = HIGH reasoning)"
else
  warn "Add to .vscode/settings.json: \"github.copilot.chat.agent.thinkingBudget\": \"high\""
fi

# .github/copilot-instructions.md
mkdir -p .github
if [[ ! -f .github/copilot-instructions.md ]]; then
  cat > .github/copilot-instructions.md << 'EOF'
# GitHub Copilot Instructions

## Tech Stack
<!-- Fill in: Language, Framework, Database, Testing -->

## Standards
- TypeScript strict mode, no `any`
- Write tests for all new functionality
- Parameterized DB queries only
- Conventional commits: type(scope): description
- Error handling at all boundaries

## Architecture
- Controllers: HTTP layer only
- Services: Business logic
- Repositories: Data access only

## Commands
- npm run dev → development
- npm test → run tests
EOF
  ok "Created .github/copilot-instructions.md (fill in your stack)"
fi

# BugBot workflow
mkdir -p .github/workflows
if [[ ! -f .github/workflows/copilot-review.yml ]]; then
  cat > .github/workflows/copilot-review.yml << 'EOF'
name: Copilot Review
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      contents: read
    steps:
      - uses: actions/checkout@v4
      - uses: github/copilot-autofix@v1
        with:
          categories: security,bugs
EOF
  ok "Created BugBot workflow (.github/workflows/copilot-review.yml)"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Copilot Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "CRITICAL: In VS Code → Chat → Change to 'Agent' mode → Reasoning=HIGH"
echo ""
echo "Skills: /tests /fix /explain /doc /review /fork"
echo "CLI:    gh copilot suggest 'task description'"
echo "CLI:    gh copilot explain 'command'"
