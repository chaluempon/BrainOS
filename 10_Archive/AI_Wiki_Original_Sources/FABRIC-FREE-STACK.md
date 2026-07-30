# Fabric-Free Stack — AI Data Agent ฟรี 100%

## ไอเดีย
ทำระบบคล้าย Microsoft Fabric Data Agent แต่ใช้ของฟรีทั้งหมด

---

## Architecture

```
User ถาม: "ยอดขายเดือนนี้เท่าไหร่?"
                    │
                    ▼
┌─────────────────────────────────────────┐
│  🤖 Ollama (LLM Local)                  │
│     - Llama 3 / Mistral                 │
│     - รันบนเครื่องตัวเอง ฟรี 100%      │
└──────────────────┬──────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│  🔗 LangChain / LlamaIndex             │
│     - Agent Framework                    │
│     - เชื่อม LLM กับ Database           │
└──────────────────┬──────────────────────┘
                   │
       ┌───────────┼───────────┐
       ▼           ▼           ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│  DuckDB  │ │  Neo4j   │ │  QuestDB │
│  (SQL)   │ │ (Graph)  │ │  (KQL)   │
│          │ │Ontology │ │Realtime  │
└──────────┘ └──────────┘ └──────────┘
```

---

## เปรียบเทียบ Fabric vs Free Stack

| Fabric (จ่ายเงิน) | Free Stack |
|-------------------|------------|
| OneLake | MinIO / PostgreSQL |
| Warehouse (Spark) | DuckDB |
| Eventhouse (KQL) | QuestDB |
| Semantic Model | Cube.dev |
| Ontology (Graph) | Neo4j |
| Data Agent | LangChain + Ollama |
| LLM | Ollama (local) |

---

## Component ที่ใช้

| Component | ใช้ทำอะไร | ราคา |
|-----------|----------|------|
| **Ollama** | LLM รัน local | ฟรี |
| **LangChain** | Agent framework | ฟรี |
| **DuckDB** | Data warehouse (SQL) | ฟรี |
| **QuestDB** | Real-time database (KQL) | ฟรี |
| **Neo4j** | Graph database (Ontology) | ฟรี |
| **Jupyter** | Notebook | ฟรี |
| **Docker** | Container | ฟรี |

---

## ข้อดี

- ✅ ฟรี 100%
- ✅ ควบคุมเองทั้งหมด
- ✅ เรียนรู้ได้ลึก
- ✅ ไม่ต้องพึ่ง Microsoft

## ข้อเสีย

- ❌ ต้อง setup เอง
- ❌ ต้องมีคนรู้ Data/Infra
- ❌ Scale จำกัดที่เครื่อง
- ❌ ใช้เวลานานกว่า Fabric

---

## Links

- Ollama: https://ollama.com
- LangChain: https://langchain.com
- DuckDB: https://duckdb.org
- QuestDB: https://questdb.io
- Neo4j: https://neo4j.com
