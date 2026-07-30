---
title: "MiroFish Architecture"
type: "topic"
subtype: "analysis"
tags: [mirofish, architecture, tech-stack, deployment]
created: 2026-04-15
updated: 2026-04-15
source_count: 1
related: [MiroFish, OASIS Framework, Qwen, Zep Cloud]
aliases: ["MiroFish Architecture"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/mirofish-architecture.md"
migration_date: 2026-07-30
domain: Architecture
knowledge_type: canonical
---

# MiroFish Architecture

The **technology stack and deployment model** of [[MiroFish]].

## Overview

MiroFish is a full-stack open-source application with separate frontend and backend, designed for easy self-hosting via npm scripts or Docker.

## Tech Stack

### Runtime Requirements

| Layer | Tool | Version | Purpose |
|-------|------|---------|---------|
| Frontend | Node.js | 18+ | UI runtime, includes npm |
| Backend | Python | ≥3.11, ≤3.12 | Agent orchestration |
| Package Mgr | uv | Latest | Python dependencies |

### External Services

- **LLM:** Any OpenAI-compatible API (recommended: [[Qwen]]-plus via Alibaba Bailian)
- **Agent Memory:** [[Zep Cloud]]
- **Simulation Engine:** [[OASIS Framework]] (CAMEL-AI)

### Required Environment Variables

```
LLM_API_KEY=your_api_key
LLM_BASE_URL=https://dashscope.aliyuncs.com/compatible-mode/v1
LLM_MODEL_NAME=qwen-plus
ZEP_API_KEY=your_zep_api_key
```

## Deployment Options

### Option 1 — Source (Dev)
```
npm run setup:all   # install everything
npm run dev         # start frontend + backend
```
- Frontend: http://localhost:3000
- Backend: http://localhost:5001

### Option 2 — Docker
```
cp .env.example .env
docker compose up -d
```
- Port 3000 (frontend), 5001 (backend)
- Mirror addresses in docker-compose.yml for faster pulls

## Individual Service Commands

```
npm run backend    # backend only
npm run frontend   # frontend only
```

## Cost Consideration

Source notes that LLM consumption is **high** — recommends keeping simulations under **40 rounds** initially to manage cost.

## Related Entities

- [[MiroFish]] — the product
- [[OASIS Framework]] — simulation engine
- [[Qwen]] — recommended LLM
- [[Zep Cloud]] — memory service

## Related Topics

- [[MiroFish Workflow]] — logical process
- [[Multi-Agent Simulation]] — methodology

## Sources

- [[mirofish-github|MiroFish GitHub Repository]] (2026-04-15)
