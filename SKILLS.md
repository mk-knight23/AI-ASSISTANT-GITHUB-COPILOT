# 🤖 Elite Skill Set: AI-ASSISTANT-GITHUB-COPILOT

This file defines the high-fidelity agentic skills for the GitHub Copilot / VS Code environment.

---

## 🪲 Skill: BugBot Autonomous Reviewer
**Trigger**: Every Pull Request or major code push.
**Instructions**:
1. Invoke BugBot to scan for logic errors, security vulnerabilities, and performance bottlenecks.
2. Focus on "Production Readiness" - check for hardcoded secrets and unhandled async errors.
3. Use the "Autofix" capability to suggest and implement immediate repairs.
4. Integrate BugBot feedback into the `implementation_plan.md`.

---

## 🐚 Skill: CLI Assistant (`gh copilot`)
**Trigger**: Complex terminal operations, infrastructure setup, or shell script debugging.
**Instructions**:
1. Use `gh copilot suggest` for shell, gh, and git commands.
2. Use `gh copilot explain` to understand legacy shell scripts before refactoring.
3. Sync terminal context with the VS Code extension for a unified understanding.

---

## ⚔️ Skill: Slash-Command Mastery
**Trigger**: Chat interactions in VS Code or JetBrains.
**Instructions**:
1. Use `/tests` to generate comprehensive unit tests for the current selection.
2. Use `/fix` to quickly resolve linting errors pointed out by the editor.
3. Use `/explain` to build a mental map of a complex, undocumented module.
4. Use `/compact` to summarize the current conversation and reclaim context window space.

---

## 🌐 Skill: Integrated Browser Validation
**Trigger**: UI/UX development and CSS refactoring.
**Instructions**:
1. Use the integrated "Copilot Preview" to render HTML/React components.
2. Ask Copilot to "Compare this preview to the design mockup."
3. Request "Accessibility Audits" directly in the browser preview.
4. Iterate on styling in real-time within the chat panel.

---

## 📥 Skill: Session Forking & Context Management
**Trigger**: When exploring multiple implementation approaches.
**Instructions**:
1. Use `/fork` to create a separate reasoning branch for an alternative design.
2. Use "Custom Instructions" in the extension settings to define persistent global behaviors.
3. Add `@workspace` to ensure Copilot is indexing the entire repository, not just open files.
4. Clear the session periodically with `/clear` after a successful merge to prevent context poisoning.
