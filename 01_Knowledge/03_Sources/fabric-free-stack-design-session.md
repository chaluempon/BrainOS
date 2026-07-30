---
title: "Fabric-Free Stack Design Session"
type: source
tags: [design-session, data-platform, open-source, llm-agent]
created: 2026-04-22
updated: 2026-04-22
source_files:
  - FABRIC-FREE-STACK.md
  - FABRIC-QUICKSTART.md
  - FABRIC-ROADMAP.md
origin: "LLM synthesis + Microsoft Fabric reference (https://www.microsoft.com/th-th/microsoft-fabric)"
related:
  - fabric-free-stack-architecture
  - fabric-free-roadmap
  - fabric-free-quickstart
aliases: ["Fabric-Free Stack Design Session"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/sources/fabric-free-stack-design-session.md"
migration_date: 2026-07-30
domain: Sources
knowledge_type: source
---

# Fabric-Free Stack Design Session

## Metadata

- **Date ingested:** 2026-04-22
- **Origin:** User asked "อยากทำโปรเจคที่ทำงานได้เหมือน Microsoft Fabric แต่ฟรี 100%"
- **Reference product:** [Microsoft Fabric](https://www.microsoft.com/th-th/microsoft-fabric) (paid SaaS)
- **Format:** 3 Markdown design docs (architecture, quickstart, roadmap)

## Summary

Design session เพื่อออกแบบระบบ data + AI platform ที่ใช้ open-source ทดแทน Microsoft Fabric แบบครบวงจร ครอบคลุม 7 ส่วนหลักของ Fabric:

1. **OneLake** (storage) → [[minio]] + [[apache-iceberg]]
2. **Data Factory** (ETL) → Airflow / Dagster
3. **Data Engineering** (Spark) → [[apache-spark]]
4. **Data Warehouse** (SQL) → [[duckdb]] / [[trino]] / ClickHouse
5. **Data Science** (notebook + ML) → JupyterHub + MLflow
6. **Real-Time Analytics** (KQL) → [[questdb]] / Kafka + Flink
7. **Power BI** (dashboard) → [[apache-superset]] / Metabase

เพิ่ม AI agent layer ด้วย [[ollama]] + [[langchain]] + [[neo4j]] (ontology/GraphRAG)

## Key Outputs

- **Architecture:** [[fabric-free-stack-architecture]]
- **Implementation plan:** [[fabric-free-roadmap]] (5 phases, 10-16 วัน)
- **Setup guide:** [[fabric-free-quickstart]]

## Entities Extracted

Products/Tools: [[microsoft-fabric]], [[ollama]], [[langchain]], [[duckdb]], [[questdb]], [[neo4j]], [[minio]], [[apache-iceberg]], [[apache-spark]], [[apache-superset]], [[trino]]

## Trade-offs Discussed

- ฟรี license แต่ไม่ฟรีเวลา/hardware (ต้อง 32GB RAM, ต้อง ops)
- ไม่มี single pane of glass (ต้องสลับ UI หลายตัว)
- ต้อง SSO เอง (Keycloak/Authentik)
- Scale จำกัดที่ single-node (เว้นแต่เพิ่ม Spark/Trino cluster)

## Recommended Start

Phase 1 MVP: Docker Compose เดียว รวม [[minio]] + [[duckdb]] + [[apache-superset]] + Airflow → เห็นภาพ data flow ใน 1 สุดสัปดาห์
