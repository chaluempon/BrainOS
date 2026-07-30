---
title: "MinIO"
type: tool
tags: [storage, s3-compatible, object-storage, onelake-alternative]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - apache-iceberg
aliases: ["MinIO"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/minio.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# MinIO

## What

High-performance S3-compatible object storage ที่ deploy เองได้ — เป็น drop-in replacement ของ AWS S3

## Role in Fabric-Free Stack

- **Layer:** Unified storage (data lake)
- **Replaces:** Fabric OneLake
- ใช้คู่กับ [[apache-iceberg]] → ได้ lake-house architecture

## Key Features

- 100% S3 API compatible
- Erasure coding (resilience)
- Encryption (KMS)
- Multi-tenant (bucket policies)
- Single binary + Docker

## Run

```bash
# กำหนด Credential จริงผ่าน environment หรือ secret manager ก่อนรัน
: "${MINIO_ROOT_USER:?Set MINIO_ROOT_USER before running}"
: "${MINIO_ROOT_PASSWORD:?Set MINIO_ROOT_PASSWORD before running}"
docker run -d --name minio \
  -p 9000:9000 -p 9001:9001 \
  -e MINIO_ROOT_USER="${MINIO_ROOT_USER}" \
  -e MINIO_ROOT_PASSWORD="${MINIO_ROOT_PASSWORD}" \
  minio/minio server /data --console-address :9001
```

- S3 API: http://localhost:9000
- Console: http://localhost:9001

## Usage Pattern

ใช้เป็น backing store ของ:
- [[apache-iceberg]] tables (parquet + manifest files)
- Delta Lake
- Raw data files (CSV, JSON, images)

อ่านจาก [[duckdb]] / [[trino]] / [[apache-spark]] ได้ตรง ผ่าน S3 protocol

## เทียบเคียง

- SeaweedFS — distributed, เล็กกว่า
- Ceph RGW — storage cluster ใหญ่
- Garage — simple, less features

## Links

- https://min.io

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
