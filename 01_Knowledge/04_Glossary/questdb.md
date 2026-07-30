---
title: "QuestDB"
type: tool
tags: [database, time-series, real-time, sql, kql-alternative]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-quickstart
aliases: ["QuestDB"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/questdb.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# QuestDB

## What

Open-source time-series database ที่รองรับ SQL + InfluxDB Line Protocol + PostgreSQL wire protocol

## Role in Fabric-Free Stack

- **Layer:** Real-Time Analytics
- **Replaces:** Fabric Eventhouse / KQL Database
- ใช้สำหรับ event stream, sensor data, metrics, logs

## Key Features

- เร็วระดับ micro-second สำหรับ time-range query
- SQL + time extensions: `SAMPLE BY`, `LATEST ON`, `ASOF JOIN`
- Web console built-in (port 9000)
- Ingest: InfluxDB Line Protocol / PG wire / REST

## SQL ตัวอย่าง

```sql
-- Time-bucket aggregation
SELECT region, SUM(amount)
FROM sales
SAMPLE BY 1h;

-- Latest value per key
SELECT sensor_id, temperature
FROM readings
LATEST ON timestamp PARTITION BY sensor_id;
```

## เทียบเคียง

- InfluxDB — flux language, less SQL
- TimescaleDB — PostgreSQL extension
- ClickHouse — general OLAP (time-series ได้ด้วย)

## Run

```bash
docker run -d --name questdb \
  -p 9000:9000 -p 8812:8812 \
  questdb/questdb:latest
```

- Web console: http://localhost:9000
- PG protocol: port 8812

## Links

- https://questdb.io

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
- [[fabric-free-quickstart]]
