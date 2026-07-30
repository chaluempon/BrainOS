# Wiki Agent - MVP Design Document

**Date:** 2026-04-15  
**Version:** 1.0  
**Status:** Approved

---

## Overview

This document defines the architecture and workflows for **Wiki Agent MVP** — a personal knowledge system that automatically ingests sources, extracts information, and maintains a persistent wiki.

**Core Philosophy:**
- You curate sources and ask questions
- Agent does all bookkeeping (summarizing, cross-referencing, updating)
- Wiki grows and gets smarter with every source

---

## Architecture

### Directory Structure

```
📦 Wiki Root
├── 📋 raw/                    # Source files (user drops here)
│   ├── *.md                   # Markdown files
│   ├── *.txt                  # Text files
│   ├── *.pdf                  # PDF files
│   └── urls.txt               # URLs to fetch
├── 📖 wiki/                   # Generated wiki (agent maintains)
│   ├── index.md               # Master catalog
│   ├── log.md                 # Activity log
│   ├── entities/              # Entity pages (people, concepts, places)
│   ├── topics/                # Topic pages (themes, summaries, analyses)
│   └── sources/               # Source metadata pages
├── 📂 .archive/               # Processed source files (moved after ingest)
├── ⚙️ rules.md                # System configuration (handlers, rules)
├── 📘 CLAUDE.md               # This file - schema + workflows
└── .obsidian/                 # Obsidian config
```

### Core Components

**1. Format Handlers (rules.md)**
- `.md` handler: Direct import
- `.txt` handler: Parse → structured sections
- `.pdf` handler: Extract text + images
- `http://` handler: Fetch + convert HTML → markdown

**2. Wiki Pages**
- **entities/** — People, concepts, places, events (semantic units)
- **topics/** — Themes, summaries, analyses, synthesis (knowledge units)
- **sources/** — Source metadata (title, date, entities, summary)

**3. Index & Log**
- **index.md** — Master catalog (entities, topics, sources) for search & navigation
- **log.md** — Append-only activity timeline

---

## Schema & Metadata

All wiki pages use **YAML frontmatter**:

```yaml
---
title: "Page Title"
type: "entity | topic | source"
tags: [tag1, tag2]             # Categories
created: YYYY-MM-DD            # Creation date
updated: YYYY-MM-DD            # Last update
source_count: N                # Sources that mention this (topics only)
related: [page1, page2]        # Cross-references
---
```

### Page Types

**Entity Page** (entities/*)
- Represents: person, concept, place, event
- Content: description, key facts, context
- Links: all sources/topics mentioning this entity

**Topic Page** (topics/*)
- Represents: theme, learning goal, project, analysis
- Content: synthesis from multiple sources
- Updates: when new related sources arrive
- Links: source pages, entity pages

**Source Page** (sources/*)
- Represents: one ingested file/URL
- Content: title, metadata, summary, extracted entities
- Links: entities mentioned, topics covered

---

## Configuration (rules.md)

`rules.md` defines how the agent processes sources:

```markdown
# Rules & Configuration

## Format Handlers

### Markdown (.md)
- Import strategy: Direct
- Extract: headings, sections, tags
- Create pages: entities, topics, source metadata

### Text (.txt)
- Parse: line breaks = sections
- Extract: paragraph boundaries, keywords
- Create pages: source metadata, topic summary

### PDF
- Extract: text, images, metadata
- Process: by chapter/section
- Create pages: source metadata, topic per chapter

### URLs (http://)
- Fetch: HTML → markdown
- Extract: title, content, metadata
- Create pages: source metadata, topic summary

## Entity Rules
- Auto-create when mentioned 2+ times
- Tag with: type (person|concept|place|event)
- Link bidirectionally to sources

## Topic Rules
- Auto-create for major themes
- Synthesize from multiple sources
- Update cross-references when new sources arrive

## Linking Rules
- Bidirectional: if A mentions B, then B mentions A
- Auto-detect from content
- Update index.md on every ingest
```

**User can modify rules.md anytime** — agent adapts on next ingest.

---

## Workflows

### 🔄 Ingest Workflow

**Trigger:** User drops file/URL into `raw/`

**Process:**
1. Agent detects file format
2. Route to appropriate handler (rules.md)
3. Extract content + metadata
4. Identify entities, themes, connections
5. Create/update wiki pages:
   - `sources/*` — source metadata
   - `entities/*` — mentioned entities (auto-create if new)
   - `topics/*` — themes and summaries
6. Update `index.md` with new entries
7. Append entry to `log.md`
8. Move source file → `.archive/`

**Duration:** ~1-3 minutes per source (depends on size)

**Output:** Updated wiki, new cross-references, log entry

---

### 🔍 Query Workflow

**Trigger:** You ask a question

**Process:**
1. Search `index.md` for relevant pages
2. Read entity/topic/source pages
3. Synthesize answer with citations
4. (Optional) Create new analysis page if insight is valuable

**Example:**
```
You: "Who is Person X?"
Agent:
  1. Search index.md → find entities/person-x.md
  2. Read page + linked sources
  3. Synthesize answer
  4. Cite: "According to article-1.md and article-2.md..."
```

---

### 🧹 Maintenance Workflow

**Frequency:** Monthly or as-needed

**Tasks:**
- Lint wiki: orphan pages, broken links, contradictions
- Update frontmatter dates (updated field)
- Review tag consistency
- Archive stale temporary notes
- Consolidate redundant topics

---

## index.md Structure

**Master catalog** (auto-maintained):

```markdown
# Wiki Index

Last updated: 2026-04-15

## Entities (X pages)
- [[Entity A]] — type, Y sources
- [[Entity B]] — type, Z sources

## Topics (X pages)
- [[Topic A]] — summary, Z sources
- [[Topic B]] — summary, Y sources

## Sources (X pages)
- [[Source 1]] — date, Z entities
- [[Source 2]] — date, Y entities
```

**Usage:** Search by name, type, or tag

---

## log.md Structure

**Activity timeline** (append-only):

```markdown
# Activity Log

## [2026-04-15] ingest | Article Title
- Format: markdown
- Entities touched: 3 (new: 2, updated: 1)
- Topics touched: 2 (new: 1, updated: 1)
- New pages: 3
- Status: ✓ Complete

## [2026-04-14] query | "What is concept X?"
- Pages read: 2
- Answer synthesized
- (Optional) Analysis page created

## [2026-04-13] lint | Weekly maintenance
- Orphan pages found: 0
- Broken links fixed: 2
- Contradictions flagged: 1
- Status: ✓ Complete
```

**Usage:** Timeline, debugging, understanding wiki evolution

---

## Implementation Phases

### Phase 1: Foundation (MVP)
- ✓ Create directory structure
- ✓ Write rules.md template
- ✓ Create index.md template
- ✓ Create log.md template
- ✓ Document CLAUDE.md (this file)

### Phase 2: Operations (After MVP approved)
- Ingest workflow automation
- Entity/topic auto-creation logic
- Cross-reference resolution
- Query & synthesis

### Phase 3: Scaling (Future)
- Add templates for other domains (research, books, business)
- Build search engine (qmd or custom)
- Add Dataview queries
- Integrate with external APIs

---

## Usage Example

**Scenario:** You read an article about "Deep Learning"

**Step 1:** Download article → `raw/article-deep-learning.md`

**Step 2:** Agent ingests:
```
[Agent processes...]
✓ Created sources/article-deep-learning.md
✓ Created entities/deep-learning.md (new)
✓ Created entities/neural-networks.md (new)
✓ Created topics/machine-learning.md (updated)
✓ Updated index.md (3 new entries)
✓ Appended to log.md
✓ Moved to .archive/article-deep-learning.md
```

**Step 3:** You query:
```
You: "What are neural networks?"
Agent: [Reads entities/neural-networks.md + sources]
Agent: "Neural networks are computational models inspired by biological neurons.
Found in: article-deep-learning.md, book-chapter-2.md
Related topics: [[Deep Learning]], [[Machine Learning]]"
```

**Step 4:** Wiki grows smarter:
- More entities = better connections
- More sources = richer synthesis
- Cross-references stay current

---

## Key Principles

1. **Human curates, LLM maintains** — You find sources, agent does bookkeeping
2. **Structure by convention** — Rules in rules.md, not hardcoded
3. **Modular & extensible** — Add format handlers without refactoring
4. **Persistence compounds** — Wiki value grows with every source
5. **Obsidian-native** — Works inside Obsidian (graph view, links, etc.)

---

## Software Engineering Agent Standard

This vault is also a reusable standard for AI agents that create or refactor software projects in other repositories.

Before starting a software project, the agent should read:

1. `wiki/topics/software-engineering-project-standard.md`
2. `wiki/topics/ai-agent-software-delivery-playbook.md`
3. `wiki/topics/secure-software-engineering-checklist.md`

The agent must use these pages as the default engineering baseline for:

- Repository structure
- Architecture choice
- Test strategy
- CI/CD quality gates
- Secure coding rules
- Secret handling
- Dependency and supply-chain security
- Final delivery reporting

If a target framework has stronger conventions, follow the framework convention while preserving the intent of this standard: clear boundaries, testability, repeatable builds, and secure defaults.

---

## Notes for Implementation

- **Search:** At MVP scale (~100 sources, ~200 pages), `index.md` is sufficient. Later: add qmd or embedding-based search.
- **Automation:** Agent processes ingest end-to-end. Can be triggered manually or via file system watcher.
- **Obsidian integration:** All wiki pages are markdown. Obsidian reads them natively (graph view, backlinks, etc.)
- **Git tracking:** Wiki is a git repo. Version history automatic.

---

**Status:** ✅ Approved 2026-04-15  
**Next Step:** Implementation plan (writing-plans skill)

---

## 📖 วิธีใช้งาน Wiki Agent (User Guide - ภาษาไทย)

### 1️⃣ เพิ่มข้อมูลใหม่ (Ingest)

**ขั้นตอน:**
1. Drop ไฟล์ (`.md`, `.txt`, `.pdf`, URL) → `raw/` folder
2. พิมพ์คำสั่งในแชท:
   ```
   "ingest ไฟล์ใหม่ใน raw/"
   "ช่วยอ่านไฟล์ xxx และสร้าง entities/topics ให้หน่อย"
   ```

**Agent จะทำอัตโนมัติ:**
- ✓ อ่านและเข้าใจเนื้อหา
- ✓ สร้าง entities (คน, แนวคิด, องค์กร, สถาน)
- ✓ สร้าง topics (สรุป, การวิเคราะห์, synthesis)
- ✓ สร้าง source page (metadata)
- ✓ ทำ bidirectional backlinks (เชื่อมโยงไปกลับ)
- ✓ อัปเดต `wiki/index.md`
- ✓ เขียน log ใน `wiki/log.md`
- ✓ ย้ายไฟล์ต้นทาง → `.archive/`

---

### 2️⃣ ถามคำถาม (Query)

**ตัวอย่างคำถาม:**
```
"MiroFish คืออะไร?"
"เปรียบเทียบ GraphRAG กับ RAG ปกติ"
"ใครสร้าง OASIS Framework?"
"สรุปความสัมพันธ์ระหว่าง MiroFish กับ CAMEL-AI"
```

**Agent จะ:**
1. ค้นหาใน `wiki/index.md`
2. อ่านหน้า entity/topic ที่เกี่ยวข้อง
3. Synthesize คำตอบ พร้อม citations
4. (ทางเลือก) สร้าง analysis page ใหม่หากคำตอบมีคุณค่าเพียงพอ

---

### 3️⃣ สำรวจความเชื่อมโยง (Explore)

**ใน Obsidian:**
- **Graph View:** `Ctrl + Shift + G` → ดูเครือข่าย entities/topics
- **Search:** `Ctrl + F` / `Ctrl + O` → ค้นหาหน้า
- **Click `[[link]]`:** กระโดดไประหว่างหน้า
- **Backlinks panel:** ดูว่าหน้าไหนลิงก์มาหาหน้านี้

---

### 4️⃣ บำรุงรักษา (Lint / Maintenance)

**รันเดือนละครั้ง:**
```
"lint wiki ให้หน่อย"
"ตรวจสอบ wiki มี orphan pages ไหม"
"หา broken links ใน wiki"
```

**Agent จะตรวจสอบ:**
- Orphan pages (ไม่มีลิงก์เข้า)
- Broken `[[wiki-links]]`
- Contradictions ระหว่างหน้า
- Tag ที่ไม่สอดคล้อง
- Stale temporary notes

---

### 5️⃣ ปรับกฎ (Modify Rules)

**แก้ไข `rules.md` เมื่อต้องการเปลี่ยนพฤติกรรม Agent:**
- เพิ่ม format handler ใหม่ (เช่น `.docx`, `.epub`)
- ปรับเกณฑ์สร้าง entity (เช่น จาก 2+ mentions → 3+)
- เปลี่ยนรูปแบบ frontmatter
- กำหนด tag conventions

Agent จะใช้กฎใหม่ทันทีในการ ingest ครั้งถัดไป — ไม่ต้อง restart

---

### 6️⃣ Git Version Control

**Commit บ่อยๆ เพื่อเก็บประวัติ:**
```
"commit การเปลี่ยนแปลง"
"push ขึ้น github"
```

**Remote:** https://github.com/chaluempon/Ai_WiKi

---

### 💡 Tips & Best Practices

1. **ตั้งชื่อไฟล์ต้นทางให้ความหมาย** — `article-ai-safety.md` ดีกว่า `doc1.md`
2. **Ingest ทีละไฟล์** — ให้ Agent ทำงานโฟกัส จะคุณภาพดีกว่า batch
3. **ถามเฉพาะเจาะจง** — "MiroFish ใช้ LLM ตัวไหน?" ดีกว่า "เล่าเรื่อง MiroFish"
4. **ใช้ Obsidian graph view บ่อยๆ** — จะเห็นภาพรวมความรู้ที่สะสม
5. **Review log.md** — ดูว่า wiki เติบโตอย่างไร
6. **Wiki = Git repo** — Commit บ่อย backup อัตโนมัติ

---

### 🚨 กฎสำคัญสำหรับ Agent

1. **Project root ที่ถูก:** `D:\OneDrive - NOVA KORAT COMPANY LIMITED\Antigarvity\Ai_WiKi`
   - ⚠️ สะกด "**Antigarvity**" (ไม่มี 'v') — ไม่ใช่ "Antigravity"
2. **ห้ามสร้างโฟลเดอร์ใหม่** นอกโครงสร้างที่กำหนด
3. **ถามก่อนทำ** เมื่อไม่แน่ใจ
4. **ตรวจสอบ path ก่อนใช้ทุกครั้ง**

---

### 📂 โครงสร้างไฟล์อ้างอิงด่วน

```
Ai_WiKi/
├── raw/              ← Drop ไฟล์ที่นี่
├── wiki/
│   ├── entities/     ← Agent สร้างให้
│   ├── topics/       ← Agent สร้างให้
│   ├── sources/      ← Agent สร้างให้
│   ├── index.md      ← Catalog (auto-update)
│   └── log.md        ← Timeline (auto-append)
├── .archive/         ← ไฟล์ต้นทางที่ประมวลผลแล้ว
├── rules.md          ← Config (user แก้ไขได้)
└── CLAUDE.md         ← ไฟล์นี้
```
