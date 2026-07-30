---
title: "Ollama"
type: tool
tags: [llm, local-inference, open-source, ai-runtime]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-quickstart
  - langchain
aliases: ["Ollama"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/ollama.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Ollama

## What

LLM runtime ที่รันโมเดลบน local hardware — download + serve โมเดลเป็น HTTP API ด้วยคำสั่งเดียว

## Role in Fabric-Free Stack

- **Layer:** AI / LLM inference
- **Replaces:** Azure OpenAI / Fabric Copilot ที่ต้องจ่ายเงิน
- เป็น LLM backbone ของ [[fabric-free-stack-architecture]]

## Key Features

- รันโมเดลได้หลายตัว: Llama 3, Mistral, Qwen, Phi, Gemma
- HTTP API บน port 11434
- GPU acceleration (CUDA / Metal / ROCm)
- Model library พร้อม pull command

## Common Commands

```bash
ollama pull llama3
ollama run llama3 "Hello"
ollama serve              # HTTP API
```

## Integration

- [[langchain]] ผ่าน `langchain_community.llms.Ollama`
- OpenAI-compatible API (`/v1/chat/completions`)

## Hardware

- RAM: 8 GB+ สำหรับ 7B model, 16 GB+ สำหรับ 13B, 32 GB+ สำหรับ 70B (quantized)
- GPU: optional แต่ช่วยเร็วมาก

## Links

- https://ollama.com

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
- [[fabric-free-quickstart]]
