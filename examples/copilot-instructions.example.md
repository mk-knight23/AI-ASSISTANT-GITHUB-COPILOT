# .github/copilot-instructions.md — Example
# Place this in your project's .github/ directory
# Copilot reads this automatically in every session

## Project: [YOUR PROJECT NAME]

## Tech Stack
- Runtime: Node.js 20
- Language: TypeScript 5 (strict mode)
- Framework: Fastify
- ORM: Drizzle + PostgreSQL
- Tests: Vitest + Supertest
- Frontend: Next.js 15 App Router

## Architecture Rules
- **Controllers**: Handle HTTP request/response only. No business logic.
- **Services**: All business logic. No direct database access.
- **Repositories**: All database access. Returns domain objects, not raw DB rows.
- Errors bubble up: Repository → Service → Controller → HTTP response

## Coding Standards
- TypeScript strict mode: no `any`, no `@ts-ignore`
- Immutable data: return new objects, never mutate
- All functions must be under 50 lines
- All async code must handle errors (try/catch or .catch())
- Use Zod for validation at all API boundaries
- No `console.log` in production code — use the logger service

## Testing Requirements
- Unit tests for every service function
- Integration tests for every API endpoint
- E2E tests for critical user journeys (auth, checkout, profile)
- Minimum 80% coverage before PR merge

## Commit Format
```
feat(auth): add refresh token rotation
fix(payments): handle failed card gracefully
refactor(users): extract user validation to service
test(api): add integration tests for notifications
```

## Commands
```bash
npm run dev        # Development server with hot reload
npm test           # All tests
npm run test:unit  # Unit tests only
npm run test:e2e   # End-to-end tests
npm run build      # Production build
npm run migrate    # Run pending DB migrations
```

## Important Notes
- Never use `DELETE CASCADE` — soft deletes only
- Always paginate list endpoints (default limit: 20, max: 100)
- Rate limit all authenticated endpoints: 1000 req/hour
- Log all errors with context (user ID, request ID, stack trace)
