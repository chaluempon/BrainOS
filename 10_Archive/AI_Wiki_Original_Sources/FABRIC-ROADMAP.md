# Fabric-Free Stack — Roadmap

## ขั้นตอนการทำ

### Phase 1: เริ่มต้น (1-2 วัน)

- [ ] ติดตั้ง Docker Desktop
- [ ] ติดตั้ง Ollama
- [ ] ลองรัน LLM (Llama 3 หรือ Mistral)

### Phase 2: Data Layer (2-3 วัน)

- [ ] ตั้ง DuckDB (SQL Warehouse)
- [ ] ตั้ง QuestDB (Real-time KQL)
- [ ] ตั้ง Neo4j (Graph Database)
- [ ] เชื่อมต่อทั้งหมดด้วย Docker

### Phase 3: Agent Layer (3-5 วัน)

- [ ] ติดตั้ง LangChain
- [ ] สร้าง Agent เชื่อมกับ DuckDB
- [ ] สร้าง Agent เชื่อมกับ QuestDB
- [ ] สร้าง Ontology ใน Neo4j

### Phase 4: Integration (2-3 วัน)

- [ ] รวม Agent ทั้งหมด
- [ ] ทำ RAG pipeline
- [ ] ทดสอบถาม-ตอบ

### Phase 5: UI/UX (2-3 วัน)

- [ ] ทำ Chat interface
- [ ] แสดงผลลัพธ์เป็นกราฟ
- [ ] Deploy บนเครื่อง

---

## รวม: 10-16 วัน

---

## สิ่งที่ต้องมี

- Docker Desktop
- RAM 16GB+ (รัน LLM local)
- คนที่รู้เรื่อง Python/SQL

---

## Milestones

| Week | สิ่งที่ได้ |
|------|----------|
| Week 1 | LLM รัน local ได้ + ถามตอบได้ |
| Week 2 | เชื่อม Database + Query ได้ |
| Week 3 | Agent คุยกับ Data ได้ |
| Week 4 | Chat UI + Demo ได้ |
