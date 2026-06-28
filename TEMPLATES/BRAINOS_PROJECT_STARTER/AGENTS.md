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

Before making changes, agents must read:

- `https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md`
- `BRAINOS/BRAINOS_ADOPTION.md`
- `BRAINOS/PROJECT_RULES.md`
- `BRAINOS/SECURITY_EXPOSURE_CHECKLIST.md`

## Required Behavior

- Read project instructions and relevant documentation before editing.
- Make the smallest correct change that can be verified.
- Keep changes scoped to the current project.
- Do not modify external BrainOS source files from this project.
- Do not introduce new frameworks, infrastructure, databases, queues, authentication systems, or external services unless explicitly approved.
- Preserve user changes and unrelated work.
- Verify meaningful changes with project-native checks where available.

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
