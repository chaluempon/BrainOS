---
title: "Fabric-Free Stack Architecture"
type: analysis
tags: [architecture, data-platform, open-source, fabric-alternative]
created: 2026-04-22
updated: 2026-04-22
source_count: 1
related:
  - fabric-free-stack-design-session
  - fabric-free-roadmap
  - fabric-free-quickstart
  - microsoft-fabric
aliases: ["Fabric-Free Stack Architecture"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/fabric-free-stack-architecture.md"
migration_date: 2026-07-30
domain: Architecture
knowledge_type: canonical
---

# Fabric-Free Stack Architecture

## Overview

สถาปัตยกรรมระบบ data + AI platform ที่ใช้ open-source ทดแทน [[microsoft-fabric]] ครบทุก component โดยไม่มีค่า license

## Component Mapping (Fabric → Open Source)

| Microsoft Fabric | ทางเลือก Open Source | บทบาท |
|---|---|---|
| **OneLake** | [[minio]] + [[apache-iceberg]] / Delta Lake | Unified storage (S3 API + table format) |
| **Data Factory** | Apache Airflow / Dagster | ETL/pipeline orchestration |
| **Data Engineering** | [[apache-spark]] standalone | Distributed compute |
| **Data Warehouse** | [[duckdb]] / [[trino]] / ClickHouse | SQL analytics engine |
| **Data Science** | JupyterHub + MLflow | Notebook + ML tracking |
| **Real-Time Analytics** | [[questdb]] / Kafka + Flink / RisingWave | Streaming + time-series |
| **Power BI** | [[apache-superset]] / Metabase | BI dashboards |
| **Data Activator** | n8n / Node-RED | Alert + automation |
| **Purview (catalog)** | OpenMetadata / DataHub | Data catalog + lineage |
| **Data Agent (AI)** | [[ollama]] + [[langchain]] + [[neo4j]] | LLM + agent + ontology |

## Reference Architecture Diagram

```
              ┌─────────────────────────────────────┐
              │   Superset / Metabase  (BI layer)   │
              └──────────────┬──────────────────────┘
                             │ SQL
              ┌──────────────▼──────────────────────┐
              │   Trino / DuckDB   (query engine)   │
              └──────────────┬──────────────────────┘
                             │ read Iceberg tables
┌────────────┐   ┌───────────▼──────────┐   ┌───────────────┐
│  Airflow/  │──▶│  MinIO + Iceberg     │◀──│  Spark jobs   │
│  Dagster   │   │  (OneLake เทียบเท่า) │   │  (batch ETL)  │
└────────────┘   └───────────▲──────────┘   └───────────────┘
                             │
              ┌──────────────┴──────────────────────┐
              │  Kafka ──▶ RisingWave/Flink         │
              │  (streaming ingest)                 │
              └─────────────────────────────────────┘
                             │
                             ▼
              ┌─────────────────────────────────────┐
              │ OpenMetadata (catalog/lineage)      │
              │ JupyterHub + MLflow (DS/ML)         │
              │ n8n (alert/automation)              │
              └─────────────────────────────────────┘
```

## AI Agent Layer (เทียบ Fabric Data Agent)

```
User Query: "ยอดขายเดือนนี้เท่าไหร่?"
            │
            ▼
    ┌──────────────────┐
    │  Ollama (LLM)    │  ← Llama 3 / Mistral / Qwen (local)
    └────────┬─────────┘
             │
             ▼
    ┌──────────────────┐
    │  LangChain Agent │  ← Tool routing + reasoning
    └────────┬─────────┘
             │
     ┌───────┼────────┐
     ▼       ▼        ▼
 ┌───────┐ ┌──────┐ ┌──────┐
 │DuckDB │ │Neo4j │ │QuestDB│
 │ (SQL) │ │(Graph│ │ (KQL) │
 │       │ │ RAG) │ │       │
 └───────┘ └──────┘ └──────┘
```

## Pros / Cons

### ข้อดี
- ✅ ฟรี 100% (license)
- ✅ ควบคุมเองเต็มที่ (data sovereignty)
- ✅ เรียนรู้ลึก เพราะเห็นทุก layer
- ✅ ไม่ผูกกับ vendor

### ข้อจำกัด
- ❌ ไม่มี single pane of glass (UI แยก 5-6 ตัว)
- ❌ ต้องทำ SSO เอง (Keycloak/Authentik)
- ❌ Scale จำกัดที่ single-node ถ้าไม่ cluster
- ❌ ต้องมี ops skill

## Hardware Minimum

- CPU: 8 cores
- RAM: **32 GB** (รัน LLM + Spark + DBs พร้อมกัน)
- Disk: 500 GB SSD
- OS: Linux (Ubuntu 22.04 แนะนำ) หรือ Docker Desktop

## Related

- Implementation: [[fabric-free-roadmap]]
- Setup commands: [[fabric-free-quickstart]]
- Source: [[fabric-free-stack-design-session]]
