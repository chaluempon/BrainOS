---
title: "Software Engineering Standards Research"
type: "source"
source_type: "research"
date: 2026-05-08
tags: [software-engineering, architecture, security, github, owasp]
entities: [clean-architecture, vertical-slice-architecture, owasp-asvs, owasp-samm, codeql]
related_topics: [software-engineering-project-standard, ai-agent-software-delivery-playbook, secure-software-engineering-checklist]
aliases: ["Software Engineering Standards Research"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
migrated_from: "wiki/sources/software-engineering-standards-research.md"
migration_date: 2026-07-30
domain: Sources
knowledge_type: source
---

# Software Engineering Standards Research

**Source Type:** research
**Date:** 2026-05-08
**Author:** AI-assisted research session

## Summary

This source captures reusable references for turning Ai_WiKi into a software engineering standard that AI agents can apply when creating or refactoring projects. The emphasis is project structure, architecture, testing, CI/CD, and security.

## Key References

- GitHub CodeQL Action: https://github.com/github/codeql-action
- GitHub supply chain security: https://github.com/security/advanced-security/software-supply-chain
- GitHub secure build system guidance: https://docs.github.com/en/enterprise-cloud@latest/code-security/tutorials/implement-supply-chain-best-practices/securing-builds
- OWASP Secure Coding Practices: https://owasp.org/www-project-secure-coding-practices-quick-reference-guide/
- OWASP ASVS: https://github.com/OWASP/ASVS
- OWASP SAMM: https://owasp.org/www-project-samm/
- Awesome Clean Architecture: https://github.com/SSWConsulting/awesome-clean-architecture
- TypeScript Clean Architecture example: https://github.com/adbayb/clean-architecture
- Node Clean Architecture template: https://github.com/JamieLivingstone/node-clean-architecture
- ASP.NET Clean Architecture template: https://github.com/ardalis/CleanArchitecture
- NestJS DDD DevOps reference: https://github.com/andrea-acampora/nestjs-ddd-devops
- Vertical Slice Architecture template: https://github.com/Amitpnk/Vertical-Slice-Architecture

## Key Takeaways

- A strong project starts with clear module boundaries, not only working code.
- Clean Architecture protects business logic from framework and infrastructure churn.
- Vertical Slice Architecture is useful when feature ownership matters more than strict horizontal layers.
- Secure development requires process controls, application controls, and supply-chain controls.
- CI should run repeatable checks in a fresh environment and should include tests, build, static analysis, and dependency checks.
- AI agents should explain risks, add verification, and avoid committing secrets.

## Entities Mentioned

- [[Clean Architecture]] — architecture baseline for maintainable systems.
- [[Vertical Slice Architecture]] — feature-oriented architecture option.
- [[OWASP ASVS]] — application security requirements baseline.
- [[OWASP SAMM]] — secure SDLC maturity model.
- [[CodeQL]] — GitHub static analysis tool.

## Related Topics

- [[Software Engineering Project Standard]]
- [[AI Agent Software Delivery Playbook]]
- [[Secure Software Engineering Checklist]]
