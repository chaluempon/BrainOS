---
title: "Obsidian Best Practices"
type: "topic"
tags: [obsidian, pkm, knowledge-management, best-practices]
created: 2026-05-08
updated: 2026-05-08
source_count: 1
related: [obsidian-skills, Ai_WiKi]
aliases: ["Obsidian Best Practices"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/obsidian-best-practices.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# 💎 Obsidian Best Practices

สรุปแนวทางการใช้งาน Obsidian ให้เกิดประสิทธิภาพสูงสุด อ้างอิงจากเทคนิคของ **Steph Ango (CEO Obsidian)** และโปรเจกต์ **obsidian-skills**

---

## 1. 🏗️ Structure with Properties (YAML)

การใช้ **Properties** ช่วยให้ AI และตัวเราเองค้นหาและจัดการข้อมูลได้ง่ายขึ้น

- **Consistent Metadata:** ทุกหน้าควรมี `title`, `type`, `tags`, `created`, และ `updated`
- **Link Types:** ใช้ Properties ในการเชื่อมโยงความสัมพันธ์ เช่น `related: [[page-name]]` หรือ `parent: [[category-page]]`
- **Status Tracking:** ใช้ฟิลด์ `status` เพื่อดูว่าบันทึกนั้นอยู่ในขั้นไหน (e.g., `seed`, `sprout`, `evergreen`)

---

## 2. 🔗 The Power of Links (Not Folders)

ใน Obsidian **"ลิงก์สำคัญกว่าโฟลเดอร์"**

- **Wikilinks:** ใช้ `[[Page Name]]` เพื่อสร้างการเชื่อมโยงแบบใยแมงมุม
- **Unlinked Mentions:** คอยตรวจสอบว่ามีคำไหนที่ควรจะเป็นลิงก์แต่ยังไม่ได้ทำ เพื่อสร้างความเชื่อมโยงใหม่ๆ
- **MOCs (Map of Content):** สร้างหน้าดัชนีสำหรับหัวข้อใหญ่ๆ เพื่อรวบรวมลิงก์ที่เกี่ยวข้องไว้ในที่เดียว (คล้ายกับ `wiki/index.md` ของเรา)

---

## 3. 🎨 Visual Thinking with Canvas

ใช้ **JSON Canvas (`.canvas`)** สำหรับข้อมูลที่ซับซ้อนหรือการระดมสมอง

- **Non-linear Notes:** ใช้ Canvas เมื่อต้องการเห็นภาพรวมที่ความสัมพันธ์ไม่ได้เป็นแค่เส้นตรง
- **Project Planning:** วางไฟล์ที่เกี่ยวข้องทั้งหมดลงในผืนผ้าใบเดียวเพื่อดูความคืบหน้า

---

## 4. 📝 Obsidian-Flavored Markdown

ใช้ฟีเจอร์เฉพาะของ Obsidian เพื่อให้บันทึกน่าอ่านและมีพลัง

- **Callouts:** ใช้สำหรับเน้นข้อความสำคัญ
  ```markdown
  > [!INFO] เคล็ดลับ
  > การจดบันทึกที่ดีคือการจดเพื่อให้ "ตัวเราในอนาคต" เข้าใจ
  ```
- **Embedding:** ใช้ `![[Page Name]]` เพื่อดึงเนื้อหาจากหน้าอื่นมาแสดงผลโดยไม่ต้อง Copy-Paste
- **Properties Display:** เปิดการแสดงผล Properties ที่หัวเอกสารเพื่อความสะดวก

---

## 5. 🤖 AI-Ready Notes (The "obsidian-skills" Way)

เตรียมบันทึกให้พร้อมสำหรับการทำงานร่วมกับ AI Agent

- **Clean Content:** ใช้ทักษะ **Defuddle** (ลบส่วนเกินของหน้าเว็บ) ก่อนบันทึก เพื่อให้ AI ไม่งง
- **Clear Headings:** ใช้ Hierarchy ของ Header (#, ##, ###) อย่างชัดเจนเพื่อให้ AI เข้าใจโครงสร้างเนื้อหา
- **Atomic Notes:** จดบันทึกเรื่องเดียวต่อหนึ่งไฟล์ (ถ้าเป็นไปได้) เพื่อให้ AI ค้นหาและอ้างอิงได้อย่างแม่นยำ

---

## 🛠️ เครื่องมือแนะนำ

- **Dataview:** สำหรับการสร้าง Query ข้อมูลอัตโนมัติ
- **Templater:** สำหรับการสร้างโครงสร้างไฟล์ที่เหมือนกันทุกครั้ง
- **Periodic Notes:** สำหรับการจด Daily/Weekly/Monthly notes

---

**Last Updated:** 2026-05-08
**Related:** Ai_WiKi, obsidian-skills
