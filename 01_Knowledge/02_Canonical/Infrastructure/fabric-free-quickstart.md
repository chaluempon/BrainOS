---
title: "Fabric-Free Quickstart"
type: topic
tags: [quickstart, setup, docker, fabric-alternative]
created: 2026-04-22
updated: 2026-04-22
source_count: 1
related:
  - fabric-free-stack-design-session
  - fabric-free-stack-architecture
  - fabric-free-roadmap
aliases: ["Fabric-Free Quickstart"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/fabric-free-quickstart.md"
migration_date: 2026-07-30
domain: Infrastructure
knowledge_type: canonical
---

# Fabric-Free Quickstart

คำสั่ง setup Fabric-Free Stack แบบ copy-paste ได้เลย

## 1. Prerequisites

**Docker Desktop:** https://docker.com/desktop

**Ollama:**
```bash
# macOS / Linux
curl -fsSL https://ollama.com/install.sh | sh

# Windows: download จาก https://ollama.com
```

**Python 3.10+:**
```bash
pip install langchain langchain-community duckdb psycopg2-binary neo4j jupyter
```

## 2. รัน Services (Docker)

```bash
# Neo4j (Graph DB)
docker run -d --name neo4j \
  -p 7474:7474 -p 7687:7687 \
  neo4j:latest

# QuestDB (Real-time KQL)
docker run -d --name questdb \
  -p 9000:9000 -p 8812:8812 \
  questdb/questdb:latest

# PostgreSQL (สำรอง/metadata)
# กำหนดค่าจริงผ่าน environment หรือ secret manager ก่อนรัน
: "${POSTGRES_PASSWORD:?Set POSTGRES_PASSWORD before running}"
docker run -d --name postgres \
  -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
  -p 5432:5432 \
  postgres:latest
```

## 3. รัน LLM ([[ollama]])

```bash
ollama pull llama3
ollama serve

# ทดสอบ (terminal ใหม่)
ollama run llama3 "Hello"
```

## 4. รัน Jupyter

```bash
# กำหนด Token จริงผ่าน environment หรือ secret manager ก่อนรัน
: "${JUPYTER_TOKEN:?Set JUPYTER_TOKEN before running}"
docker run -d --name jupyter \
  -p 8888:8888 \
  -e JUPYTER_TOKEN="${JUPYTER_TOKEN}" \
  jupyter/scipy-notebook:latest
```

เปิด Browser: http://localhost:8888

## 5. [[langchain]] + [[ollama]] + [[duckdb]] ตัวอย่าง

```python
from langchain_community.llms import Ollama
from langchain.agents import AgentType, initialize_agent
from langchain.tools import Tool
import duckdb

# 1. เชื่อม LLM
llm = Ollama(model="llama3")

# 2. เชื่อม DuckDB
con = duckdb.connect('my_db.duckdb')

def query_duckdb(query):
    result = con.execute(query).fetchdf()
    return str(result)

# 3. สร้าง Tool
tools = [
    Tool(
        name="DuckDB",
        func=query_duckdb,
        description="Query DuckDB database"
    )
]

# 4. สร้าง Agent
agent = initialize_agent(
    tools, llm,
    agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION,
    verbose=True
)

# 5. ถาม
agent.run("ยอดขายรวมเท่าไหร่?")
```

## 6. [[neo4j]] Ontology ตัวอย่าง (Cypher)

```cypher
CREATE (p:Product {name: 'สินค้า A'})
CREATE (c:Customer {name: 'ลูกค้า 1'})
CREATE (s:Sales {amount: 5000, date: date('2026-01-01')})

MATCH (p:Product), (c:Customer), (s:Sales)
CREATE (c)-[:BOUGHT]->(p)
CREATE (p)-[:SOLD_IN]->(s)
```

## 7. [[questdb]] Query ตัวอย่าง

```sql
-- ข้อมูล realtime
SELECT * FROM sales
WHERE timestamp > NOW() - INTERVAL '1' DAY;

-- รวมยอดขายทุก 1 ชั่วโมง
SELECT region, SUM(amount)
FROM sales
SAMPLE BY 1h;
```

## 8. Docker Compose รวม

```yaml
# docker-compose.yml
version: '3.8'
services:
  ollama:
    image: ollama/ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama

  neo4j:
    image: neo4j:latest
    ports:
      - "7474:7474"
      - "7687:7687"

  questdb:
    image: questdb/questdb:latest
    ports:
      - "9000:9000"
      - "8812:8812"

  jupyter:
    image: jupyter/scipy-notebook
    ports:
      - "8888:8888"
    volumes:
      - ./notebooks:/home/jovyan/work

volumes:
  ollama_data:
```

```bash
docker-compose up -d
```

## Service URLs

| Service | URL |
|---------|-----|
| Jupyter | http://localhost:8888 |
| Neo4j Browser | http://localhost:7474 |
| QuestDB Console | http://localhost:9000 |
| Ollama API | http://localhost:11434 |

## Related

- Architecture: [[fabric-free-stack-architecture]]
- Roadmap: [[fabric-free-roadmap]]
- Source: [[fabric-free-stack-design-session]]
