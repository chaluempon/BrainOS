# Project Rules

**Document Status:** Active  
**Owner:** Project Owner  
**Last Updated:** YYYY-MM-DD

This project follows BrainOS Global AI Engineering Rules.

Canonical BrainOS global rules:

```text
/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS/GLOBAL_RULES.md
```

Agents must read the canonical BrainOS global rules before making changes. This file contains only project-local rules and stricter project-specific requirements.

## Local Operating Rules

- Make the smallest correct change that can be verified.
- Read existing code and documentation before editing.
- Prefer project-native tooling and existing patterns.
- Keep changes scoped to the current project.
- Do not perform unrelated cleanup or refactors.
- Do not store secrets in source code, prompts, documentation, screenshots, logs, or examples.
- Do not modify external BrainOS source files from this project.

## Project-Specific Security Requirements

These requirements are stricter local additions to the canonical BrainOS Global Security Rules.

- No public Ollama access.
- No unauthenticated dev server.
- No unauthenticated dashboard, notebook, AI UI, workflow builder, or admin panel.
- No Docker port publishing without localhost binding or explicit approval.
- No temporary tunnel without owner, approval, logging, and expiry date.
- No public storage bucket, backup, export, or log file.
- No CI/CD runner may execute untrusted code unless explicitly approved and isolated.
