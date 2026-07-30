# 🧠 Ai_WiKi — Personal Knowledge Base with AI Agent

> **สมองที่ 2 แบบอัตโนมัติ** — Drop ไฟล์ → AI อ่าน วิเคราะห์ เชื่อมโยง และสร้าง wiki ให้เอง

[![Obsidian](https://img.shields.io/badge/Obsidian-Vault-purple)](https://obsidian.md/)
[![Markdown](https://img.shields.io/badge/Format-Markdown-blue)](https://www.markdownguide.org/)
[![License](https://img.shields.io/badge/License-Personal-green)]()

---

## 📖 โปรเจกต์นี้คืออะไร

**Ai_WiKi** คือระบบ Personal Knowledge Base ที่ใช้ **AI Agent (Claude)** ทำหน้าที่ "บรรณารักษ์" อัตโนมัติ:

- 📥 **คุณ:** หาแหล่งข้อมูล (บทความ, หนังสือ, รายงาน) แล้ว drop เข้า `raw/`
- 🤖 **Agent:** อ่าน → สกัด entities/topics → ทำ backlinks → อัปเดต wiki
- 🔍 **คุณ:** ถามคำถาม → Agent ตอบพร้อม citations จาก wiki

**ต่างจาก RAG ทั่วไป:** ความรู้**สะสม**ใน wiki (persistent), ไม่ใช่หาใหม่ทุกครั้ง

---

## 🚀 Quick Start

### 1. Clone & Open

```bash
git clone https://github.com/chaluempon/Ai_WiKi.git
cd Ai_WiKi
```

เปิดโฟลเดอร์ใน [Obsidian](https://obsidian.md/) (File → Open Vault)

### 2. เพิ่มแหล่งข้อมูล

```
Drop ไฟล์ (.md, .txt, .pdf, URL) → raw/ folder
```

### 3. สั่ง Agent (Claude Code) ให้ ingest

```
"ingest ไฟล์ใหม่ใน raw/ ให้หน่อย"
```

### 4. ถามคำถาม

```
"MiroFish คืออะไร?"
"เปรียบเทียบ X กับ Y"
```

---

## 📂 โครงสร้างโปรเจกต์

```
Ai_WiKi/
├── raw/                  📥 Drop ไฟล์ต้นทางที่นี่
├── wiki/                 📚 Agent สร้าง/บำรุงรักษาที่นี่
│   ├── entities/         🧩 คน, แนวคิด, องค์กร, สถาน
│   ├── topics/           📊 สรุป, การวิเคราะห์, synthesis
│   ├── sources/          📄 Metadata ของไฟล์ต้นทาง
│   ├── index.md          📋 Master catalog (auto-update)
│   └── log.md            📅 Activity timeline (auto-append)
├── .archive/             📦 ไฟล์ที่ประมวลผลแล้ว
├── rules.md              ⚙️ Configuration (กฎการประมวลผล)
├── CLAUDE.md             🤖 Schema + workflows สำหรับ Agent
├── USAGE-EXAMPLE.md      💡 ตัวอย่างการใช้งาน step-by-step
└── README.md             📘 ไฟล์นี้
```

---

## ✨ Features

| Feature | คำอธิบาย |
|---------|---------|
| 🤖 **Auto-Ingest** | Drop ไฟล์ → Agent อ่าน+สร้าง wiki ให้อัตโนมัติ |
| 🧩 **Entity Extraction** | สกัดคน/แนวคิด/องค์กรที่กล่าวถึง ≥2 ครั้ง |
| 📊 **Topic Synthesis** | สรุปธีมข้ามหลาย source |
| 🔗 **Auto Backlinks** | Bidirectional links ระหว่างหน้าที่เกี่ยวข้อง |
| 📋 **Living Index** | `index.md` อัปเดตตัวเองทุกครั้งที่ ingest |
| 📅 **Activity Log** | `log.md` บันทึกทุก action ไว้ |
| 🎨 **Obsidian Graph** | Visualize เครือข่ายความรู้เป็น graph |
| 🔄 **Git Version Control** | ประวัติการเปลี่ยนแปลงครบ |
| ⚙️ **Rule-Driven** | แก้ `rules.md` → พฤติกรรม Agent เปลี่ยนทันที |
| 📦 **Multi-Format** | รองรับ `.md`, `.txt`, `.pdf`, URLs |

---

## 🎯 Use Cases

- 📖 **อ่านหนังสือ** — สร้าง wiki ตัวละคร/ธีม/เหตุการณ์
- 🔬 **งานวิจัย** — สังเคราะห์ความรู้ข้ามหลาย paper
- 💼 **ธุรกิจ** — เก็บ meeting notes, project docs, customer calls
- 🎯 **พัฒนาตัวเอง** — บันทึกบทเรียน, goals, reflections
- 🛠️ **Competitive analysis** — ติดตาม products/companies

---

## 📚 เอกสารเพิ่มเติม

| ไฟล์ | เนื้อหา |
|------|--------|
| [CLAUDE.md](./CLAUDE.md) | Design document + วิธีใช้งานครบถ้วน + schema |
| [rules.md](./rules.md) | Configuration (format handlers, entity rules, linking rules) |
| [USAGE-EXAMPLE.md](./USAGE-EXAMPLE.md) | ตัวอย่างการใช้งาน step-by-step |
| [wiki/index.md](./wiki/index.md) | Catalog ของทุกหน้าใน wiki |
| [wiki/log.md](./wiki/log.md) | ประวัติการเปลี่ยนแปลง |

---

## 🧪 ตัวอย่างที่ Ingest แล้ว

**[[MiroFish]]** (2026-04-15) — AI prediction engine ด้วย multi-agent simulation
- 10 entities, 4 topics, 1 source
- ลองเปิด [wiki/entities/mirofish.md](./wiki/entities/mirofish.md)

---

## 🛠️ Tech Stack

- **Knowledge Store:** Markdown files (human-readable, future-proof)
- **Viewer:** [Obsidian](https://obsidian.md/) (graph view, backlinks)
- **Agent:** [Claude Code](https://claude.com/claude-code) (Anthropic)
- **Version Control:** Git + GitHub
- **No Database:** ทุกอย่างเป็นไฟล์ — backup/migrate ได้ง่าย

---

## 💡 Philosophy

> **Human curates, LLM maintains**
> คุณหาแหล่งข้อมูล, AI ทำงานบันทึก/เชื่อมโยง/อัปเดต
>
> **Persistence compounds**
> ยิ่งเพิ่ม source wiki ยิ่งฉลาด — cross-references ยิ่งเยอะ
>
> **Structure by convention, not code**
> กฎอยู่ใน `rules.md` (เปลี่ยนได้) ไม่ใช่ฝังใน logic

แรงบันดาลใจจาก [Vannevar Bush's Memex (1945)](https://en.wikipedia.org/wiki/Memex) — knowledge store แบบ associative ส่วนตัว ที่ AI ช่วยทำ maintenance ที่มนุษย์เบื่อ

---

## 🚨 กฎสำคัญ

1. **Project root:** `D:\OneDrive - NOVA KORAT COMPANY LIMITED\Antigarvity\Ai_WiKi`
2. โฟลเดอร์โปรเจกต์ทั้งหมดอยู่ใน `Antigarvity\` (สะกดนี้ ไม่ใช่ "Antigravity")
3. ห้าม Agent สร้างโฟลเดอร์ใหม่นอกโครงสร้างที่กำหนด

---

## 📬 Contact

- **Owner:** chaluempon
- **Repository:** https://github.com/chaluempon/Ai_WiKi

---

**Last updated:** 2026-04-16
