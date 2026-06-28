# BrainOS Adoption

**Document Status:** Active  
**Owner:** Project Owner  
**Last Updated:** YYYY-MM-DD

This project adopts BrainOS as its governance and AI engineering rule foundation.

Canonical BrainOS source:

```text
https://github.com/chaluempon/BrainOS
```

Canonical rule file:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

## Adoption Scope

This project adopts BrainOS rules for:

- AI agent behavior.
- Engineering execution.
- Documentation standards.
- Security and privacy governance.
- Data, integration, and dependency review.
- Workflow and automation governance.

## Local Rule Files

Project-local rule files:

- `AGENTS.md`
- `BRAINOS/PROJECT_RULES.md`
- `BRAINOS/SECURITY_EXPOSURE_CHECKLIST.md`

## Source Of Truth

BrainOS canonical rules remain the upstream source of truth. Agents must read the canonical `GLOBAL_RULES.md` directly from BrainOS instead of relying on copied rule text.

Project-local rules may add stricter requirements, but must not weaken BrainOS global rules.

If internet access is unavailable, use an approved local mirror or Git submodule only as a fallback.

## Project Override Rule

Any project-specific exception must be documented with:

- Owner.
- Reason.
- Scope.
- Risk.
- Expiry date.
- Review date.

Exceptions without an owner, review date, or expiry date must be removed.
