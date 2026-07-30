---
title: "GraphRAG"
type: "concept"
subtype: "technique"
tags: [rag, knowledge-graph, ai, llm]
created: 2026-04-15
updated: 2026-04-15
source_count: 1
related: [MiroFish, Digital Twin]
aliases: ["GraphRAG"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/graphrag.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# GraphRAG

**GraphRAG** (Graph Retrieval-Augmented Generation) is a technique that combines knowledge graphs with LLM retrieval-augmented generation to provide structured, relational context for AI reasoning.

## Definition

An extension of traditional RAG where retrieval operates over a knowledge graph rather than flat text chunks. This preserves entity relationships and enables more sophisticated reasoning about connected information.

## Key Facts

- Extends traditional RAG with graph structure
- Preserves **entity relationships**
- Enables relational reasoning
- Used in the **Graph Building** phase of [[MiroFish Workflow]]

## Role in MiroFish

Used in **Workflow Step 1: Graph Building**:
- Seed extraction from input materials
- Individual/collective memory injection
- **GraphRAG construction** — builds the knowledge graph underlying the [[Digital Twin]]

## Related Entities

- [[MiroFish]] — applies GraphRAG for world-building
- [[Digital Twin]] — the output of GraphRAG construction

## Sources

- [[mirofish-github|MiroFish GitHub Repository]] (2026-04-15)
