---
title: "LangChain"
type: tool
tags: [agent-framework, llm, python, orchestration]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-quickstart
  - ollama
aliases: ["LangChain"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/langchain.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# LangChain

## What

Framework สำหรับสร้าง LLM-powered applications — จัดการ chains, agents, tools, memory, retrieval (RAG)

## Role in Fabric-Free Stack

- **Layer:** Agent orchestration
- **Replaces:** Fabric Data Agent (proprietary)
- ทำหน้าที่ route คำถาม → เลือก tool (SQL / Graph / Time-series) → synthesize ตอบ

## Key Concepts

- **Chain:** sequence ของ LLM calls + transformations
- **Agent:** LLM ตัดสินใจเองว่าจะใช้ tool ไหน
- **Tool:** function ที่ LLM เรียกได้ (query DB, search web, etc.)
- **Memory:** เก็บ context ระหว่าง turn

## Common Integrations

- [[ollama]] (LLM)
- SQLAlchemy / [[duckdb]] / [[neo4j]] (data tools)
- FAISS / Chroma (vector store)

## Code Pattern

```python
from langchain_community.llms import Ollama
from langchain.agents import initialize_agent, AgentType
from langchain.tools import Tool

llm = Ollama(model="llama3")
tools = [Tool(name="DuckDB", func=query_fn, description="...")]
agent = initialize_agent(tools, llm, agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION)
agent.run("คำถาม")
```

## Alternatives

- LlamaIndex (เน้น RAG)
- Haystack
- Semantic Kernel (Microsoft)

## Links

- https://langchain.com

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
- [[fabric-free-quickstart]]
