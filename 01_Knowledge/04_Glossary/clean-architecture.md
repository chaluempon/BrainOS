---
title: "Clean Architecture"
type: "concept"
tags: [architecture, software-engineering, maintainability, testing]
created: 2026-05-08
updated: 2026-05-08
source_count: 1
related: [software-engineering-project-standard, vertical-slice-architecture]
aliases: ["Clean Architecture"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/clean-architecture.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Clean Architecture

Clean Architecture is a software architecture style that separates business rules from frameworks, databases, and delivery mechanisms.

## Definition

The core idea is dependency inversion: high-level policy and domain rules should not depend on low-level technical details. Details such as web frameworks, databases, queues, and cloud SDKs live at the edges.

## Common Layers

- Domain: entities, value objects, core rules.
- Application: use cases, commands, queries, ports.
- Infrastructure: database, external API clients, queues, email, file storage.
- Interfaces: HTTP controllers, CLI, UI, workers.

## When To Use

- Long-lived business systems.
- Projects that need strong testability.
- Systems that may change database, framework, UI, or deployment approach.
- Teams that need clear module boundaries.

## Risks

- Too much ceremony for small scripts.
- Poorly implemented layers can become pass-through boilerplate.
- Requires discipline to prevent infrastructure imports from leaking inward.

## Related Topics

- [[Software Engineering Project Standard]]
- [[AI Agent Software Delivery Playbook]]

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
