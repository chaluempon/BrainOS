---
title: "Vertical Slice Architecture"
type: "concept"
tags: [architecture, software-engineering, modularity, cqrs]
created: 2026-05-08
updated: 2026-05-08
source_count: 1
related: [software-engineering-project-standard, clean-architecture]
aliases: ["Vertical Slice Architecture"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/vertical-slice-architecture.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Vertical Slice Architecture

Vertical Slice Architecture organizes code by feature or use case instead of broad technical layers.

## Definition

Each feature owns its request model, validation, handler, persistence access, response model, and tests. The goal is to keep related behavior close together and reduce cross-feature coupling.

## Example Layout

```text
src/
├─ features/
│  ├─ create-order/
│  │  ├─ handler.ts
│  │  ├─ validator.ts
│  │  ├─ route.ts
│  │  └─ tests/
│  └─ list-orders/
├─ shared/
└─ infrastructure/
```

## When To Use

- APIs with many independent workflows.
- Teams that ship feature-by-feature.
- Systems where horizontal service/repository layers become too tangled.

## Risks

- Shared domain rules can be duplicated if not extracted carefully.
- Cross-feature transactions need clear boundaries.
- Requires naming discipline to keep features discoverable.

## Related Topics

- [[Software Engineering Project Standard]]
- [[AI Agent Software Delivery Playbook]]

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
