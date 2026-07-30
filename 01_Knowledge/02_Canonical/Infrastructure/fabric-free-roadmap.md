---
title: "Fabric-Free Roadmap"
type: topic
tags: [roadmap, implementation-plan, data-platform, fabric-alternative]
created: 2026-04-22
updated: 2026-04-22
source_count: 1
related:
  - fabric-free-stack-design-session
  - fabric-free-stack-architecture
  - fabric-free-quickstart
aliases: ["Fabric-Free Roadmap"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/fabric-free-roadmap.md"
migration_date: 2026-07-30
domain: Infrastructure
knowledge_type: canonical
---

# Fabric-Free Roadmap

แผนการสร้าง Fabric-Free Stack แบบ step-by-step รวมเวลา **10-16 วัน**

## Phase 1 — Foundation (1-2 วัน)

**เป้าหมาย:** LLM รันบนเครื่องตัวเองได้ + ถามตอบได้

- [ ] ติดตั้ง Docker Desktop
- [ ] ติดตั้ง [[ollama]]
- [ ] Pull Llama 3 / Mistral model
- [ ] ทดสอบ `ollama run llama3 "Hello"`

**Deliverable:** LLM REPL ทำงานได้

## Phase 2 — Data Layer (2-3 วัน)

**เป้าหมาย:** Database ทั้ง 3 ตัวรันพร้อมกัน

- [ ] [[duckdb]] (SQL warehouse) — ใช้เป็น Python library หรือ CLI
- [ ] [[questdb]] (real-time time-series) — Docker
- [ ] [[neo4j]] (graph) — Docker
- [ ] (optional) [[minio]] + [[apache-iceberg]] สำหรับ lake-house

**Deliverable:** `docker-compose up` แล้ว service ทั้งหมดเขียว

## Phase 3 — Agent Layer (3-5 วัน)

**เป้าหมาย:** AI agent คุยกับ database ได้

- [ ] ติดตั้ง [[langchain]] + langchain-community
- [ ] สร้าง Agent + Tool wrapper สำหรับ [[duckdb]]
- [ ] เพิ่ม Tool สำหรับ [[questdb]]
- [ ] สร้าง ontology ใน [[neo4j]] (GraphRAG pattern)

**Deliverable:** `agent.run("ยอดขายรวม?")` ได้คำตอบจริง

## Phase 4 — Integration (2-3 วัน)

**เป้าหมาย:** Agent เลือก tool ถูกต้องเอง + RAG จาก Graph

- [ ] รวม Agent ทั้งหมดให้เลือก tool อัตโนมัติ
- [ ] ทำ RAG pipeline จาก [[neo4j]] (GraphRAG)
- [ ] ทดสอบคำถามหลายแบบ (SQL / time-series / graph)

**Deliverable:** Agent ตัดสินใจเอง ว่าคำถามควรไป DB ไหน

## Phase 5 — UI/UX (2-3 วัน)

**เป้าหมาย:** ใช้งานจริงได้ผ่าน browser

- [ ] Chat UI (Streamlit / Chainlit / Open WebUI)
- [ ] แสดงผลลัพธ์เป็นกราฟ (Plotly / [[apache-superset]])
- [ ] Deploy บน LAN ให้คนในทีมใช้

**Deliverable:** Chat UI พร้อม demo

## Milestones

| Week | สิ่งที่ได้ |
|------|----------|
| Week 1 | LLM local + ถามตอบได้ |
| Week 2 | Database + Query ได้ |
| Week 3 | Agent คุยกับ Data ได้ |
| Week 4 | Chat UI + Demo ได้ |

## สิ่งที่ต้องมี

- Docker Desktop
- RAM **32 GB+** (สำหรับ stack เต็ม + LLM local)
- ความรู้ Python / SQL พื้นฐาน
- (ถ้าเลย Phase 2) ความรู้ Cypher (Neo4j)

## Related

- Architecture: [[fabric-free-stack-architecture]]
- Quickstart: [[fabric-free-quickstart]]
- Source: [[fabric-free-stack-design-session]]
