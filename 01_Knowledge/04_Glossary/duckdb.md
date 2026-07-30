---
title: "DuckDB"
type: tool
tags: [database, sql, olap, embedded, analytics]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-quickstart
  - apache-iceberg
aliases: ["DuckDB"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/duckdb.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# DuckDB

## What

Embedded OLAP database (เหมือน SQLite แต่สำหรับ analytics) — รันเป็น library ใน Python/R/Node, ไม่ต้องมี server

## Role in Fabric-Free Stack

- **Layer:** SQL Warehouse
- **Replaces:** Fabric Synapse Data Warehouse (Spark SQL)
- เป็น default query engine สำหรับ Phase 1 MVP

## Key Features

- Columnar storage + vectorized execution → เร็วมากกับ aggregate query
- อ่าน Parquet / CSV / JSON / [[apache-iceberg]] ได้ตรง
- ANSI SQL + PostgreSQL-compatible
- Zero-config (embedded)

## ข้อดี

- ติดตั้งแค่ `pip install duckdb`
- ไม่มี server ให้ดูแล
- อ่าน S3/MinIO parquet ได้ตรง
- เร็วกว่า PostgreSQL 10-100x สำหรับ analytics

## ข้อจำกัด

- Single-process (ไม่ scale แนวนอน)
- ไม่เหมาะ OLTP (write-heavy)

## Usage

```python
import duckdb
con = duckdb.connect('my.duckdb')
con.execute("SELECT * FROM 's3://bucket/*.parquet'").fetchdf()
```

## เทียบเคียง

- ClickHouse — server-based, scale ได้
- [[trino]] — distributed query engine
- SQLite — OLTP, ไม่ใช่ analytics

## Links

- https://duckdb.org

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
- [[fabric-free-quickstart]]
