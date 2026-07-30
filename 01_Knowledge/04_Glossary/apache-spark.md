---
title: "Apache Spark"
type: tool
tags: [compute, distributed, batch, etl, data-engineering]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - apache-iceberg
  - minio
aliases: ["Apache Spark"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/apache-spark.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Apache Spark

## What

Distributed compute engine สำหรับ large-scale data processing — รองรับ batch, streaming, SQL, ML

## Role in Fabric-Free Stack

- **Layer:** Data Engineering / heavy ETL
- **Replaces:** Fabric Synapse Data Engineering (ซึ่งก็ใช้ Spark เหมือนกัน)
- ใช้เมื่อ data ใหญ่เกิน [[duckdb]] (เกิน ~100GB หรือต้อง cluster)

## Key Features

- DataFrame / SQL / RDD API
- รองรับ Python (PySpark), Scala, Java, R
- Write to [[apache-iceberg]] / Delta / Parquet
- Structured Streaming

## Deployment Options

- **Standalone** — single-node Docker (เริ่มต้น)
- **Kubernetes** — production
- **YARN / Mesos** — Hadoop ecosystem

## ใช้ใน stack นี้เมื่อไหร่

- Data volume > 100 GB
- ต้อง parallel ETL
- เขียน Iceberg table ใหญ่ๆ

## ไม่ต้องใช้ถ้า

- Phase 1 MVP (ใช้ DuckDB พอ)
- Data < 10 GB

## Code Pattern

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("etl") \
    .config("spark.sql.catalog.iceberg", "org.apache.iceberg.spark.SparkCatalog") \
    .getOrCreate()

df = spark.read.parquet("s3a://bucket/raw/*.parquet")
df.writeTo("iceberg.db.table").create()
```

## Links

- https://spark.apache.org

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
