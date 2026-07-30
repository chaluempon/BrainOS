---
title: "Microsoft Fabric"
type: product
tags: [data-platform, saas, microsoft, baseline]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-stack-design-session
aliases: ["Microsoft Fabric"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/microsoft-fabric.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Microsoft Fabric

## What

Unified analytics + AI platform ของ Microsoft ที่รวม data engineering, warehousing, real-time analytics, data science, และ BI ไว้ใน SaaS เดียว

## Key Components

1. **OneLake** — unified data lake (ใช้ร่วมกันทุก workload)
2. **Data Factory** — ETL/ELT + data integration
3. **Synapse Data Engineering** — Spark-based processing
4. **Synapse Data Warehouse** — SQL warehouse
5. **Synapse Data Science** — notebook + ML
6. **Synapse Real-Time Analytics** — Eventhouse (KQL)
7. **Power BI** — dashboard + report
8. **Data Activator** — alert + action
9. **Data Agent** — LLM-powered data Q&A

## ทำไมถึงน่าสนใจ

- UI เดียว, billing เดียว, auth เดียว
- Semantic Model shared ข้าม workload
- Delta Lake เป็น native table format

## ข้อเสีย

- ราคาแพง (SaaS lock-in)
- ต้องใช้ Azure
- Customize จำกัด

## ใน wiki นี้ใช้เป็น baseline เทียบกับ

[[fabric-free-stack-architecture]] — open-source stack ทดแทนครบทุก component

## Links

- https://www.microsoft.com/th-th/microsoft-fabric

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
