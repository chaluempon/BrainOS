# Project Agent Rules

This project follows BrainOS Global AI Engineering Rules.

Canonical BrainOS source:

```text
https://github.com/chaluempon/BrainOS
```

Canonical BrainOS rule file:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

## Required Instructions And Conditional References

- Read the canonical Global Rules and applicable project instructions before acting, including `BRAINOS/PROJECT_RULES.md`. A verified authorized local copy of the canonical rules may be used; the URL above identifies the source, not a requirement to refetch it before every edit.
- Read `BRAINOS/BRAINOS_ADOPTION.md` when establishing or refreshing the adopted rule version and project alignment. Reuse its still-current verified state for subsequent in-scope work.
- Read `BRAINOS/SECURITY_EXPOSURE_CHECKLIST.md` when assessing or changing exposure, networking, authentication, authorization, sensitive-data handling, or integrations; the global security baseline applies to every task regardless.
- Read supporting architecture, schema, or deployment documents when the task affects those concerns, rather than loading every reference for a small edit.
- Reuse already-read rules only when their content remains available and freshness is verified under Global Rules Section 1.7. If context was lost, reload applicable instructions even when the checksum matches. Resolve unknown freshness before relying on an old copy; never bypass access controls to fetch rules.

## Required Behavior

- Read project instructions and relevant documentation before editing.
- Make the smallest correct change that can be verified.
- Keep changes scoped to the current project.
- Do not modify external BrainOS source files from this project.
- Do not introduce new frameworks, infrastructure, databases, queues, authentication systems, or external services unless explicitly approved.
- Preserve user changes and unrelated work.
- Verify meaningful changes with project-native checks where available.
- Continue approved implementation through verified-safe checks and repairs caused by the requested change until acceptance is met or a concrete blocker, operational cap, or owner gate is reached. Inspect check targets and side effects first; do not assume that local tests are isolated or have no production access. This does not grant additional commit/push, publication, production, credential, elevated-permission, payment, or destructive-action authority.

## Security Baseline

Follow the canonical Global Security Rules from:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

Project-local rules may add stricter requirements, but must not weaken the canonical BrainOS rules.

## Incident Behavior

After any abuse or suspected exposure:

1. Close access first.
2. Preserve logs.
3. Review scope.
4. Rotate affected secrets.
5. Check usage and billing.
6. Document root cause.
7. Add a prevention rule before reopening.
