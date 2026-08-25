---
title: "Secure Software Engineering Checklist"
type: "topic"
tags: [security, secure-coding, devsecops, checklist, ai-agent-standard]
created: 2026-05-08
updated: 2026-08-25
source_count: 1
related: [owasp-asvs, owasp-samm, codeql]
aliases: ["Secure Software Engineering Checklist"]
category: Migrated_Ai_WiKi
status: approved
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/secure-software-engineering-checklist.md"
migration_date: 2026-07-30
reviewed_by: "BrainOS Owner"
reviewed_date: 2026-08-25
approval_scope: "Approved for controlled internal use as the primary security standard. Apply controls proportionately to project risk, scale, data sensitivity, external exposure, and production impact."
domain: Engineering
knowledge_type: canonical
---

# Secure Software Engineering Checklist

This checklist is the minimum security gate for AI-created software projects.

## Repository Security

- `SECURITY.md` exists for vulnerability reporting.
- `.env.example` exists and contains safe placeholders only.
- Real `.env`, keys, tokens, cookies, session exports, and credentials are ignored by git.
- Branch protection requires review and passing checks for important branches.
- GitHub secret scanning is enabled when available.
- Dependabot or equivalent dependency alerts are enabled.

## Build And CI

- CI runs on pull requests.
- CI installs dependencies from lockfiles.
- CI runs lint/static checks.
- CI runs tests.
- CI runs build/typecheck/compile.
- CI runs [[CodeQL]] or equivalent SAST when supported.
- GitHub Actions jobs define least-privilege `permissions`.
- Deployment jobs require protected environments or manual approvals for production.

## Application Security

- Use [[OWASP ASVS]] as the requirements baseline for web applications and APIs.
- Validate all untrusted input.
- Encode output according to context.
- Use parameterized database queries or safe ORM APIs.
- Enforce authentication at the boundary.
- Enforce authorization per action or resource, not only per screen.
- Use secure session and token handling.
- Use TLS for network traffic.
- Do not expose debug stack traces in production.
- Use generic user-facing error messages for sensitive failures.

## Secrets And Configuration

- Never hard-code credentials.
- Load secrets from environment variables, GitHub Secrets, or a secret manager.
- Separate development, test, staging, and production configuration.
- Rotate exposed credentials immediately.
- Do not log secrets, tokens, passwords, cookies, private keys, or full connection strings.

## Data Protection

- Collect only required personal data.
- Classify sensitive data before storing it.
- Encrypt sensitive data at rest when required.
- Use least-privilege database users.
- Avoid storing plaintext passwords. Use a strong password hashing algorithm when password auth is required.
- Define data retention and deletion behavior for user data.

## Dependency And Supply Chain

- Commit lockfiles.
- Review new dependencies before adding them.
- Prefer maintained libraries with clear licenses.
- Remove unused packages.
- Keep dependencies updated with automated alerts.
- Avoid install scripts or postinstall hooks from untrusted packages.

## Logging And Monitoring

- Use structured logs.
- Include request IDs or correlation IDs for services.
- Log security-relevant events: login failure, permission denial, token refresh failure, admin changes.
- Do not log sensitive payloads by default.
- Add health checks for deployable services.

## Agent Final Gate

Before finalizing a software change, the AI agent must answer:

1. What code paths accept untrusted input?
2. What secrets or sensitive data are used?
3. What authorization checks protect important actions?
4. What tests prove the critical behavior?
5. What CI checks prevent regressions?
6. What security work remains?

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
