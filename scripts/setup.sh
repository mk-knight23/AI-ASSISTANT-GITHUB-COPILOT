#!/bin/bash
# GitHub Copilot Setup Script
# Run: chmod +x setup.sh && ./setup.sh

set -e
echo "🚀 Setting up GitHub Copilot..."

# 1. Check for VS Code
if command -v code &> /dev/null; then
  echo "✅ VS Code found"

  # Install GitHub Copilot extension
  echo "📦 Installing GitHub Copilot extension..."
  code --install-extension GitHub.copilot
  code --install-extension GitHub.copilot-chat
  echo "✅ Extensions installed"
else
  echo "⚠️  VS Code not found. Download from: https://code.visualstudio.com"
fi

# 2. Install GitHub CLI
if ! command -v gh &> /dev/null; then
  echo "📦 Installing GitHub CLI..."
  brew install gh
fi

# 3. Authenticate
echo "🔐 Authenticating with GitHub..."
gh auth login

# 4. Install Copilot CLI
echo "📦 Installing GitHub Copilot CLI..."
gh extension install github/gh-copilot

# 5. Install skills (Antigravity Awesome Skills works with Copilot!)
echo "🎯 Installing Antigravity Awesome Skills for Copilot..."
npx antigravity-awesome-skills

echo ""
echo "✨ GitHub Copilot is ready!"
echo ""
echo "VS Code Settings (add to settings.json):"
cat << 'EOF'
{
  "github.copilot.enable": { "*": true },
  "github.copilot.chat.agent.thinkingTool": true,
  "github.copilot.renameSuggestions.triggerAutomatically": true
}
EOF
echo ""
echo "Key Features:"
echo "  Tab           — Accept inline suggestion"
echo "  Ctrl+I        — Inline chat (edit current code)"
echo "  Ctrl+Shift+I  — Copilot chat panel"
echo "  /tests        — Generate tests for selection"
echo "  /fix          — Fix errors in selection"
echo "  /explain      — Explain how code works"
echo "  /review       — Code review"
echo "  @workspace    — Ask about the entire codebase"
echo "  @github       — Search GitHub PRs, issues, code"
echo ""
echo "Agent Mode (VS Code 1.110+):"
echo "  1. Open Copilot Chat"
echo "  2. Click the agent mode icon"
echo "  3. Set Reasoning to HIGH for complex tasks"
echo "  4. Describe the task — Copilot handles multi-file changes"
