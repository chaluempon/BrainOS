---
title: "Apache Superset"
type: tool
tags: [bi, dashboard, visualization, open-source]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - duckdb
  - trino
aliases: ["Apache Superset"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/apache-superset.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Apache Superset

## What

Open-source BI / data visualization platform ที่ Airbnb เริ่มทำ ปัจจุบันเป็น Apache project

## Role in Fabric-Free Stack

- **Layer:** BI / Dashboard
- **Replaces:** Power BI (ใน Fabric)
- เป็น UI หน้าบ้านสำหรับ end-user

## Key Features

- รองรับ database หลากหลาย: PostgreSQL, MySQL, [[duckdb]], [[trino]], ClickHouse, BigQuery, ฯลฯ
- SQL Lab (query editor)
- 40+ chart types
- Dashboard + filter + cross-filter
- Row-level security
- Jinja templating

## เทียบเคียง

| Tool | จุดเด่น |
|---|---|
| **Superset** | SQL-first, customize ได้เยอะ, community ใหญ่ |
| **Metabase** | UX ง่ายที่สุด, ไม่ต้องรู้ SQL |
| **Redash** | เรียบง่าย, query-focused |
| **Grafana** | เก่งกับ time-series + metrics |

## Run (Docker)

```bash
docker run -d --name superset \
  -p 8088:8088 \
  apache/superset
```

- UI: http://localhost:8088

## Connect ไป DB

- [[duckdb]]: `duckdb:///path/to/file.duckdb`
- [[trino]]: `trino://user@host:8080/catalog`
- PostgreSQL: `postgresql://user:pass@host/db`

## Links

- https://superset.apache.org

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
