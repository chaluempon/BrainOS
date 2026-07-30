---
title: "MiroFish Workflow"
type: "topic"
subtype: "analysis"
tags: [mirofish, workflow, process]
created: 2026-04-15
updated: 2026-04-15
source_count: 1
related: [MiroFish, GraphRAG, Multi-Agent System, Digital Twin]
aliases: ["MiroFish Workflow"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/mirofish-workflow.md"
migration_date: 2026-07-30
domain: AI_and_Agents
knowledge_type: canonical
---

# MiroFish Workflow

The **5-step process** by which [[MiroFish]] turns seed data into a prediction report.

## Overview

MiroFish converts unstructured input (news, reports, stories) into an interactive simulated world, then extracts predictions from that world. Each step has specific technical components.

## The 5 Steps

### Step 1 — Graph Building
- Seed extraction from input materials
- Individual/collective memory injection
- **[[GraphRAG]] construction** — builds the knowledge graph

### Step 2 — Environment Setup
- Entity relationship extraction
- **Persona generation** — creates agent personalities from graph
- Agent configuration injection

### Step 3 — Simulation
- **Dual-platform parallel simulation** for throughput
- Auto-parse prediction requirements from user's natural language
- **Dynamic temporal memory updates** (via [[Zep Cloud]])

### Step 4 — Report Generation
- **ReportAgent** with rich toolset
- Deep interaction with post-simulation environment
- Produces the detailed prediction report

### Step 5 — Deep Interaction
- User can **chat with any agent** in the simulated world
- User can interact with **ReportAgent**
- Iterative refinement of predictions

## Inputs → Outputs

**Input:**
- Seed materials (reports, news, stories)
- Natural-language prediction requirement

**Output:**
- Detailed prediction report
- Interactive high-fidelity [[Digital Twin]]

## Related Entities

- [[MiroFish]] — the engine running this workflow
- [[GraphRAG]] — step 1 technology
- [[Multi-Agent System]] — step 2-3 foundation
- [[Digital Twin]] — step 3 output
- [[Zep Cloud]] — step 3 memory

## Related Topics

- [[MiroFish Architecture]] — the tech stack
- [[Multi-Agent Simulation]] — methodology
- [[AI Prediction Technology]] — broader context

## Sources

- [[mirofish-github|MiroFish GitHub Repository]] (2026-04-15)
