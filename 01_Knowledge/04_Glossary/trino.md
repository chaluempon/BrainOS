---
title: "Trino"
type: tool
tags: [query-engine, distributed, sql, federated-query]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - apache-iceberg
  - minio
  - duckdb
aliases: ["Trino"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/trino.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Trino

## What

Distributed SQL query engine (เดิมชื่อ PrestoSQL) — query ข้าม data source หลายตัวในคำสั่ง SQL เดียว

## Role in Fabric-Free Stack

- **Layer:** Federated query engine
- **Replaces:** Fabric Warehouse (scale-out version)
- ใช้แทน [[duckdb]] เมื่อต้อง concurrent users + federated query

## Key Features

- Federated query ข้าม connector: [[apache-iceberg]] + PostgreSQL + [[minio]] + MongoDB ฯลฯ
- Massively parallel (MPP)
- ANSI SQL
- Cost-based optimizer

## ใช้เมื่อไหร่

| Scenario | ใช้อะไร |
|---|---|
| Single-user, single DB | [[duckdb]] |
| Multi-user, multi-source | **Trino** |
| Big batch ETL | [[apache-spark]] |
| Time-series only | [[questdb]] |

## Connector ตัวอย่าง

- `iceberg` — [[apache-iceberg]] tables
- `hive` — Hive metastore + [[minio]]/S3
- `postgresql` — PostgreSQL
- `kafka` — Kafka topics

## Query Pattern

```sql
-- Join ข้าม connector
SELECT o.customer_id, c.name, SUM(o.amount)
FROM iceberg.sales.orders o
JOIN postgresql.crm.customers c ON o.customer_id = c.id
GROUP BY o.customer_id, c.name;
```

## เทียบเคียง

- **Presto** — original fork (Facebook)
- **Athena** — AWS managed Presto
- **StarRocks** — เร็วกว่า แต่ community เล็กกว่า

## Links

- https://trino.io

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
