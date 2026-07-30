# Fabric-Free Stack — Quick Start

## 1. ติดตั้งก่อน

### Docker Desktop
```bash
# Download: https://docker.com/desktop
```

### Ollama
```bash
# macOS/Linux
curl -fsSL https://ollama.com/install.sh | sh

# Windows: Download จาก https://ollama.com
```

### Python (3.10+)
```bash
pip install langchain langchain-community duckdb psycopg2-binary neo4j jupyter
```

---

## 2. รัน Services

### รันทุกอย่างในครั้งเดียว

```bash
# Neo4j (Graph DB)
docker run -d --name neo4j \
  -p 7474:7474 -p 7687:7687 \
  neo4j:latest

# QuestDB (Real-time KQL)
docker run -d --name questdb \
  -p 9000:9000 -p 8812:8812 \
  questdb/questdb:latest

# PostgreSQL (สำรอง)
docker run -d --name postgres \
  -e POSTGRES_PASSWORD=secret \
  -p 5432:5432 \
  postgres:latest
```

---

## 3. รัน LLM

```bash
# Pull Llama 3
ollama pull llama3

# รัน Ollama server
ollama serve

# ทดสอบ (terminal ใหม่)
ollama run llama3 "Hello"
```

---

## 4. รัน Jupyter

```bash
docker run -d --name jupyter \
  -p 8888:8888 \
  -e JUPYTER_TOKEN=secret \
  jupyter/scipy-notebook:latest
```

เปิด Browser: http://localhost:8888

---

## 5. Python Code ตัวอย่าง

### LangChain + Ollama + DuckDB

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

---

## 6. Neo4j Schema ตัวอย่าง

```cypher
// สร้าง Ontology แบบง่าย
CREATE (p:Product {name: 'สินค้า A'})
CREATE (c:Customer {name: 'ลูกค้า 1'})
CREATE (s:Sales {amount: 5000, date: date('2026-01-01')})

MATCH (p:Product), (c:Customer), (s:Sales)
CREATE (c)-[:BOUGHT]->(p)
CREATE (p)-[:SOLD_IN]->(s)
```

---

## 7. QuestDB KQL ตัวอย่าง

```sql
-- ดูข้อมูล realtime
SELECT * FROM sales 
WHERE timestamp > NOW() - INTERVAL '1' DAY;

-- รวมยอดขาย
SELECT region, SUM(amount) 
FROM sales 
SAMPLE BY 1h;
```

---

## 8. Docker Compose (รวมทั้งหมด)

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

---

## Links

| Service | URL |
|---------|-----|
| Jupyter | http://localhost:8888 |
| Neo4j | http://localhost:7474 |
| QuestDB | http://localhost:9000 |
| Ollama | http://localhost:11434 |
