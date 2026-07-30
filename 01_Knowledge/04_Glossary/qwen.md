---
title: "Qwen"
type: "concept"
subtype: "llm-model"
tags: [llm, alibaba, ai-model, api]
created: 2026-04-15
updated: 2026-04-15
source_count: 1
related: [MiroFish]
aliases: ["Qwen"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/qwen.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Qwen

**Qwen** (通义千问) is a family of large language models developed by Alibaba, accessible via the Bailian (百炼) platform. Qwen-plus is the **recommended LLM** for [[MiroFish]].

## Definition

Alibaba's proprietary LLM family, offering OpenAI-compatible API access. The Qwen-plus variant is specifically recommended by MiroFish for its balance of capability and cost.

## Key Facts

- **Vendor:** Alibaba
- **Recommended variant:** qwen-plus
- **Access:** Via Bailian platform (https://bailian.console.aliyun.com/)
- **API format:** OpenAI-compatible
- **Endpoint:** https://dashscope.aliyuncs.com/compatible-mode/v1

## Role in MiroFish

Powers the individual agents in the simulation. MiroFish notes: *"High consumption, try simulations with fewer than 40 rounds first"* — indicating agents consume significant LLM tokens during multi-round interactions.

## Related Entities

- [[MiroFish]] — uses Qwen as its LLM backend

## Sources

- [[mirofish-github|MiroFish GitHub Repository]] (2026-04-15)
