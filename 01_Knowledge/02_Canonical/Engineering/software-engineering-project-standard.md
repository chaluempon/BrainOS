---
title: "Software Engineering Project Standard"
type: "topic"
tags: [software-engineering, project-structure, architecture, security, ai-agent-standard]
created: 2026-05-08
updated: 2026-08-25
source_count: 1
related: [clean-architecture, vertical-slice-architecture, owasp-asvs, owasp-samm, codeql]
aliases: ["Software Engineering Project Standard"]
category: Migrated_Ai_WiKi
status: approved
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/software-engineering-project-standard.md"
migration_date: 2026-07-30
reviewed_by: "BrainOS Owner"
reviewed_date: 2026-08-25
approval_scope: "Approved for controlled internal use as the default engineering standard for AI-created or refactored software projects."
domain: Engineering
knowledge_type: canonical
---

# Software Engineering Project Standard

This is the default standard for AI agents that create or refactor software projects for this workspace.

## Purpose

Every software project should be easy to understand, easy to test, safe to change, and secure by default. The agent must create structure before implementation, keep business rules separate from technical details, and add verification that prevents regressions.

## Default Repository Layout

Use this layout for new backend, API, automation, or full-stack projects unless the target framework has a stronger convention.

```text
project-root/
├─ README.md
├─ LICENSE
├─ SECURITY.md
├─ CONTRIBUTING.md
├─ CHANGELOG.md
├─ .env.example
├─ .gitignore
├─ docs/
│  ├─ architecture/
│  ├─ adr/
│  └─ api/
├─ src/
│  ├─ domain/
│  ├─ application/
│  ├─ infrastructure/
│  └─ interfaces/
├─ tests/
│  ├─ unit/
│  ├─ integration/
│  ├─ e2e/
│  └─ architecture/
├─ scripts/
├─ config/
├─ deploy/
│  ├─ docker/
│  └─ k8s/
└─ .github/
   ├─ workflows/
   └─ dependabot.yml
```

## Layer Responsibilities

### domain/

Contains the core business model and rules.

- Entities, value objects, domain services, domain events.
- No database, HTTP, framework, environment variables, or external SDK imports.
- Must be highly unit-testable.

### application/

Contains use cases and application flow.

- Commands, queries, handlers, service interfaces, DTOs.
- Calls domain logic and declares ports for external dependencies.
- Does not know concrete database, queue, email, or cloud implementations.

### infrastructure/

Contains technical adapters.

- Database repositories, ORM models, external API clients, queues, file storage, email, cache.
- Implements interfaces defined by application/domain layers.
- All credentials come from configuration, not hard-coded values.

### interfaces/

Contains entry points.

- HTTP controllers, route handlers, CLI commands, worker handlers, UI adapters.
- Validates input at the boundary and maps requests into application use cases.

### tests/

Contains verification at multiple levels.

- `unit/`: domain and use-case tests without network or database.
- `integration/`: database, external adapters, containerized services.
- `e2e/`: real user/API workflows.
- `architecture/`: dependency rules, forbidden imports, module boundary tests.

## Required Root Files

- `README.md`: purpose, setup, commands, architecture overview.
- `.env.example`: safe placeholder environment variables only.
- `SECURITY.md`: vulnerability reporting and supported versions.
- `CONTRIBUTING.md`: branch, commit, test, and review rules.
- `CHANGELOG.md`: release history.
- `docs/adr/`: architecture decision records.

## Design Rules

- Start with a small modular monolith unless there is a proven need for microservices.
- Prefer [[Clean Architecture]] for long-lived business systems.
- Prefer [[Vertical Slice Architecture]] when feature ownership and API workflows matter more than strict horizontal layers.
- Keep framework-specific code at the edges.
- Keep shared utilities small and boring. Do not create a generic `utils` dumping ground for business logic.
- Every dependency direction should point inward: interface to application, application to domain, infrastructure to application/domain.
- The domain must not import infrastructure.

## Security Rules

- Use [[OWASP ASVS]] for web/API security requirements.
- Use [[OWASP SAMM]] to improve the secure software development process over time.
- Use [[CodeQL]], dependency scanning, secret scanning, and Dependabot on GitHub repositories.
- Validate untrusted input at boundaries.
- Encode output where the platform requires it.
- Use parameterized database queries or safe ORM APIs.
- Store secrets only in environment variables, secret managers, or GitHub Secrets.
- Never commit real credentials, tokens, private keys, cookies, or production `.env` files.
- Log enough to debug, but never log secrets, passwords, tokens, session IDs, or sensitive personal data.
- Use least privilege for database users, cloud credentials, GitHub Actions permissions, and runtime service accounts.

## AI Agent Rules

Before writing code, the agent must identify:

1. Project type: API, web app, CLI, automation, library, data pipeline, or agent system.
2. Runtime and framework.
3. Main domain concepts.
4. Data stores and external integrations.
5. Security-sensitive data and trust boundaries.
6. Required tests and CI checks.

Before final delivery, the agent must verify:

1. The project runs with documented commands.
2. Tests or equivalent checks pass.
3. No secrets were introduced.
4. Project structure matches the chosen architecture.
5. `README.md` explains setup and common commands.
6. Security controls are documented or tracked as TODOs with clear risk.

## Minimal CI Gate

Every real software project should have a CI workflow that runs:

- Install dependencies from lockfile.
- Lint or static checks.
- Typecheck or compile.
- Unit tests.
- Build.
- CodeQL or equivalent SAST when supported.
- Dependency vulnerability checks.

## Related Topics

- [[AI Agent Software Delivery Playbook]]
- [[Secure Software Engineering Checklist]]

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
