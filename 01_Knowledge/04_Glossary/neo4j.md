---
title: "Neo4j"
type: tool
tags: [database, graph, ontology, graphrag, cypher]
created: 2026-04-22
updated: 2026-04-22
related:
  - fabric-free-stack-architecture
  - fabric-free-quickstart
  - graphrag
aliases: ["Neo4j"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/neo4j.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# Neo4j

## What

Graph database ที่ใช้ node + relationship + property — query ด้วย Cypher language

## Role in Fabric-Free Stack

- **Layer:** Ontology / Knowledge Graph
- **Replaces:** (Fabric ไม่มี native graph; ใช้แทน semantic model ที่ซับซ้อน)
- Backbone ของ [[graphrag]] pattern ใน agent layer

## Key Features

- Cypher query language (declarative + pattern-based)
- ACID transactions
- Bloom visualization
- Community edition ฟรี

## Cypher ตัวอย่าง

```cypher
CREATE (p:Product {name: 'สินค้า A'})
CREATE (c:Customer {name: 'ลูกค้า 1'})
CREATE (s:Sales {amount: 5000, date: date('2026-01-01')})

MATCH (p:Product), (c:Customer), (s:Sales)
CREATE (c)-[:BOUGHT]->(p)
CREATE (p)-[:SOLD_IN]->(s)
```

## Run

```bash
docker run -d --name neo4j \
  -p 7474:7474 -p 7687:7687 \
  neo4j:latest
```

- Browser: http://localhost:7474
- Bolt: bolt://localhost:7687

## Use Cases ใน stack นี้

1. Ontology (เทียบ Fabric Semantic Model)
2. [[graphrag]] — ใช้ graph เป็น context สำหรับ LLM
3. Recommendation / relationship analysis

## เทียบเคียง

- ArangoDB — multi-model (graph + doc)
- JanusGraph — distributed graph
- Memgraph — in-memory Cypher-compatible

## Links

- https://neo4j.com

## Mentioned in

- [[fabric-free-stack-design-session]]
- [[fabric-free-stack-architecture]]
- [[fabric-free-roadmap]]
- [[fabric-free-quickstart]]
