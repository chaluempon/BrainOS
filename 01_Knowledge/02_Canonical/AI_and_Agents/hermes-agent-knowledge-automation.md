---
title: "Hermes Agent Knowledge Automation"
type: "topic"
tags: [ai-agent, hermes-agent, obsidian, codex-cli, knowledge-management, automation]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [hermes-agent, obsidian-best-practices, agent-led-research]
aliases: ["Hermes Agent Knowledge Automation"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/hermes-agent-knowledge-automation.md"
migration_date: 2026-07-30
domain: AI_and_Agents
knowledge_type: canonical
---

# Hermes Agent Knowledge Automation

แนวทางใช้ [[Hermes Agent]] ร่วมกับ Obsidian และ Codex CLI เพื่อช่วยจัดระบบ knowledge base และบันทึกข้อมูลอย่างอัตโนมัติ

## สิ่งที่คลิปครอบคลุม

- โครงสร้างความรู้แบบ PARA Method: Inbox, Daily, Projects, Areas, Resources และ Archive
- การเริ่มต้นใช้งาน Hermes Agent Desktop
- การให้ Hermes Agent บันทึกข้อมูลลง Obsidian
- การใช้งานร่วมกับ Codex CLI ใน workflow จัดระเบียบความรู้

## Timestamp ที่เกี่ยวข้อง

| เวลา | หัวข้อ |
|---|---|
| 01:02 | ภาพรวม |
| 06:50 | เริ่มต้นใช้งาน Hermes Agent Desktop |
| 13:38 | ผลลัพธ์ |
| 16:46 | ให้ Hermes Agent บันทึกใน Obsidian |
| 20:45 | แก้ไขความยาวข้อมูล |

ลิงก์ที่ผู้ใช้ส่งมาเริ่มที่ `06:55` ซึ่งอยู่ในช่วงเริ่มต้นใช้งาน Hermes Agent Desktop

## แนวปฏิบัติสำหรับ vault นี้

- เก็บ source ต้นฉบับใน `raw/` และคงไว้แบบ immutable
- ให้ Agent สร้างหรืออัปเดตโน้ตตาม schema ของ vault; การย้ายหรือ archive ไฟล์เดิมต้องได้รับอนุมัติก่อน
- ห้ามใส่ passwords, API keys, tokens, private keys, internal IP addresses หรือข้อมูลลูกค้าลงในโน้ตหรือ prompt
- ตรวจ wikilinks และบันทึกกิจกรรมทุกครั้งที่มีการเปลี่ยนแปลง material

## ขอบเขตหลักฐาน

สรุปนี้อ้างอิง title, description และ chapter timestamps ที่ผู้เผยแพร่ระบุไว้ใน YouTube เมื่อวันที่ 2026-07-28 ยังไม่ได้อ้างคำพูดหรือรายละเอียดเชิงลึกจาก transcript อัตโนมัติ

## แหล่งอ้างอิง

- [[youtube-hermes-agent-obsidian-codex|YouTube — สร้างระบบความรู้อัตโนมัติด้วย Obsidian Hermes Agent และ Codex CLI]]
- [[Hermes Agent]]
- [[Obsidian Best Practices]]
