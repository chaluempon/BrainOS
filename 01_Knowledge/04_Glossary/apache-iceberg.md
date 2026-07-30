---
title: "Apache Iceberg"
type: concept
tags: [table-format, lakehouse, open-table-format, data-lake]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - minio
  - apache-spark
  - trino
aliases: ["Apache Iceberg"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/apache-iceberg.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Apache Iceberg

## What

Open table format สำหรับ huge analytic tables — เพิ่ม ACID, schema evolution, time travel ให้กับไฟล์ Parquet บน object storage

## Role in Fabric-Free Stack

- **Layer:** Table format (above storage, below query)
- **Replaces:** Delta Lake format ที่ Fabric OneLake ใช้
- ทำให้ [[minio]] + Iceberg ≈ OneLake

## Key Features

- ACID transactions บน data lake
- Schema evolution (add/drop/rename column ไม่ต้อง rewrite)
- Partition evolution
- Time travel (query snapshot เก่า)
- Hidden partitioning

## Architecture

```
table/
├── metadata/
│   ├── v1.metadata.json
│   ├── snap-*.avro      ← manifest list
│   └── *.avro           ← manifest files
└── data/
    └── *.parquet
```

## Query Engines ที่รองรับ

- [[apache-spark]] (native)
- [[trino]]
- [[duckdb]] (read)
- Flink
- Dremio

## เทียบเคียง

- **Delta Lake** — Databricks-origin, similar features, Fabric ใช้ตัวนี้
- **Apache Hudi** — เน้น incremental processing
- **Apache Paimon** — streaming-first

## เลือกตัวไหนดี?

| Need | แนะนำ |
|---|---|
| ใช้กับ Fabric-like setup | Iceberg (open + vendor-neutral) |
| ถ้าใช้ Databricks | Delta Lake |
| Streaming CDC | Hudi / Paimon |

## Links

- https://iceberg.apache.org

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
