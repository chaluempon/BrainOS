---
title: "AI Agent Software Delivery Playbook"
type: "topic"
tags: [ai-agent, software-delivery, workflow, engineering-standard]
created: 2026-05-08
updated: 2026-08-25
source_count: 1
related: [software-engineering-project-standard, clean-architecture, owasp-asvs, codeql]
aliases: ["AI Agent Software Delivery Playbook"]
category: Migrated_Ai_WiKi
status: approved
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/ai-agent-software-delivery-playbook.md"
migration_date: 2026-07-30
reviewed_by: "BrainOS Owner"
reviewed_date: 2026-08-25
approval_scope: "Approved for controlled internal use as the primary AI software-delivery playbook. Apply it proportionately to project size, risk, and type while following GLOBAL_RULES.md and the smallest verified solution principle."
domain: Engineering
knowledge_type: canonical
---

# AI Agent Software Delivery Playbook

This playbook tells an AI agent how to create or modify software projects using disciplined software engineering practices.

## Operating Principles

- Read the existing project before changing it.
- Prefer the project's existing conventions over new abstractions.
- Choose the simplest architecture that protects the domain and supports testing.
- Make small, reviewable changes.
- Verify behavior with commands, tests, or documented manual checks.
- Never hide security risks. Surface them with concrete remediation.

## Phase 1: Discovery

Collect the minimum context needed to make good decisions.

- Read `README.md`, package/config files, existing source layout, and tests.
- Identify language, framework, runtime, database, deployment target, and package manager.
- Identify whether the project is greenfield, prototype, or production.
- Identify sensitive data: credentials, personal data, payment data, internal data, tokens, session state.
- Identify trust boundaries: browser to API, API to database, worker to queue, internal to external APIs.

## Phase 2: Architecture Choice

Use this decision guide.

| Situation | Recommended Structure |
|---|---|
| Long-lived business application | [[Clean Architecture]] |
| API with many independent features | [[Vertical Slice Architecture]] |
| Small CLI/tool/script | Simple `src/`, `tests/`, `docs/` layout |
| Frontend app | Feature folders plus shared UI/design system |
| Data/automation pipeline | `src/pipelines`, `src/connectors`, `src/domain`, `tests` |
| Agent system | `src/agents`, `src/tools`, `src/workflows`, `src/memory`, `src/evals` |

## Phase 3: Project Skeleton

For a new project, create the skeleton before feature code.

Required:

- `README.md`
- `.env.example`
- `.gitignore`
- `src/`
- `tests/`
- `docs/adr/`
- `.github/workflows/ci.yml` when hosted on GitHub

Recommended for production:

- `SECURITY.md`
- `CONTRIBUTING.md`
- `CHANGELOG.md`
- `deploy/`
- `scripts/`
- `.github/dependabot.yml`

## Phase 4: Implementation Rules

- Put business rules in domain/application code.
- Put framework/database/cloud code in infrastructure/interfaces code.
- Validate all external input at the boundary.
- Use typed schemas or validators where available.
- Keep functions small enough to test directly.
- Use dependency injection or explicit constructor parameters for external dependencies.
- Avoid global mutable state unless the framework requires it.
- Use structured logging.
- Use configuration objects instead of scattered environment reads.

## Phase 5: Testing Rules

Minimum tests:

- Domain logic: unit tests.
- Use cases: unit tests with fake ports.
- Persistence adapters: integration tests.
- API endpoints: request/response tests.
- Critical workflows: e2e tests.
- Architecture boundaries: import/dependency tests when the project is large enough.

If a test cannot be added yet, the agent must document the missing test and why.

## Phase 6: Security Rules

Use [[Secure Software Engineering Checklist]] before final delivery.

Required checks:

- No real secrets committed.
- Inputs validated.
- Database access uses parameterized queries or safe ORM APIs.
- Authentication and authorization boundaries are explicit.
- Errors do not expose stack traces or sensitive internals in production.
- Logs do not include secrets or sensitive data.
- GitHub Actions permissions use least privilege.
- Dependencies are pinned with a lockfile.

## Phase 7: Delivery Response

Final response must include:

- Files changed.
- What behavior changed.
- Commands run and results.
- Security-relevant notes.
- Remaining risks or follow-up work.

## Related Topics

- [[Software Engineering Project Standard]]
- [[Secure Software Engineering Checklist]]

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
