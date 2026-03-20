# GitHub Copilot Agent Mode

## Overview

Agent Mode is an autonomous coding capability within GitHub Copilot that goes beyond simple code suggestions. Instead of completing a single line or block, Agent Mode can plan and execute multi-step tasks across your entire codebase, iterating until the job is done.

## How Agent Mode Works

Agent Mode operates in a loop of reasoning and action:

1. **Analyze** - Understands the user's intent from a natural language prompt
2. **Plan** - Breaks the task into discrete steps and identifies affected files
3. **Execute** - Makes edits across multiple files, creates new files, runs terminal commands
4. **Verify** - Checks for errors via linter output, terminal feedback, and compiler diagnostics
5. **Iterate** - Automatically fixes issues and refines until the task is complete

## Activating Agent Mode

In VS Code, switch the Copilot Chat mode selector from "Ask" or "Edit" to **Agent**:

- **Ask Mode** - Answers questions, provides code snippets (read-only)
- **Edit Mode** - Makes targeted edits to specified files
- **Agent Mode** - Autonomous multi-file editing with tool access

## Capabilities

### Multi-File Editing

Agent Mode can create, modify, and delete files across your project simultaneously. It understands project structure and maintains consistency when refactoring.

### Terminal Command Execution

Agent Mode can suggest and run terminal commands such as:

- Installing dependencies (`npm install`, `pip install`)
- Running build tools (`make`, `cargo build`)
- Executing tests (`pytest`, `jest`)
- Running linters and formatters

### Tool Integration

Agent Mode has access to built-in tools:

| Tool | Purpose |
|------|---------|
| File editing | Create, read, modify, delete files |
| Terminal | Execute shell commands |
| Search | Find files and symbols across the workspace |
| Fetch | Retrieve content from URLs (documentation, APIs) |
| MCP Servers | Connect to external tools via Model Context Protocol |

### Context Awareness

Agent Mode automatically gathers context from:

- Open files and active editor tabs
- Project structure and file tree
- Terminal output and error messages
- Linter and compiler diagnostics
- Git history and diff information

## Model Context Protocol (MCP) Integration

Agent Mode supports MCP servers, enabling integration with external tools:

```json
{
  "mcp": {
    "servers": {
      "database": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-postgres", "postgresql://localhost/mydb"]
      }
    }
  }
}
```

This allows Agent Mode to query databases, interact with APIs, and access custom tooling.

## Best Practices

### Writing Effective Prompts

- Be specific about the desired outcome, not the implementation steps
- Reference file names or functions when relevant
- Specify constraints (e.g., "do not modify the public API")
- Include acceptance criteria ("ensure all existing tests still pass")

### Reviewing Agent Output

- Always review the proposed changes before accepting
- Check the diff view for unintended modifications
- Verify that terminal commands are safe before allowing execution
- Use the undo feature to revert unwanted changes

### When to Use Agent Mode vs Edit Mode

| Scenario | Recommended Mode |
|----------|-----------------|
| Single file change | Edit Mode |
| Rename a variable across files | Agent Mode |
| Add a new feature with tests | Agent Mode |
| Fix a specific bug | Edit Mode |
| Scaffold a new module | Agent Mode |
| Refactor architecture | Agent Mode |

## Limitations

- Agent Mode requires user approval for terminal commands by default
- Large-scale refactors may need multiple iterations
- Complex architectural decisions benefit from human guidance
- Generated code should always be reviewed before merging

## Configuration

Control Agent Mode behavior in VS Code settings:

```json
{
  "github.copilot.chat.agent.autoApprove": false,
  "github.copilot.chat.agent.maxIterations": 10,
  "github.copilot.chat.agent.enableTerminalCommands": true
}
```

## Further Reading

- [GitHub Copilot Agent Mode Documentation](https://docs.github.com/en/copilot/using-github-copilot/using-agent-mode)
- [Model Context Protocol Specification](https://modelcontextprotocol.io)
