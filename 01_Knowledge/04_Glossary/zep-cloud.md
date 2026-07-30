---
title: "Zep Cloud"
type: "concept"
subtype: "service"
tags: [memory, ai-infrastructure, saas]
created: 2026-04-15
updated: 2026-04-15
source_count: 1
related: [MiroFish, Multi-Agent System]
aliases: ["Zep Cloud"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/zep-cloud.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Zep Cloud

**Zep Cloud** is a managed long-term memory service for AI agents, used by [[MiroFish]] to give its agents persistent memory across simulation rounds.

## Definition

A cloud SaaS providing agent memory infrastructure — storing, indexing, and retrieving past conversations and facts so AI agents maintain coherent long-term context. MiroFish uses it so each of its thousands of agents can have independent, evolving memory.

## Key Facts

- **URL:** https://app.getzep.com/
- **Pricing:** Free tier available (sufficient for simple MiroFish usage)
- **Required env var:** `ZEP_API_KEY`

## Role in MiroFish

Provides the "**long-term memory**" property of MiroFish agents. Referenced in workflow step 3: *"Dynamic temporal memory updates"*.

## Related Entities

- [[MiroFish]] — uses Zep for agent memory
- [[Multi-Agent System]] — memory enables agent persistence

## Sources

- [[mirofish-github|MiroFish GitHub Repository]] (2026-04-15)
