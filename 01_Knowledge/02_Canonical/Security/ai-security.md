---
title: "AI Security"
type: "topic"
tags: [ai-security, ai-governance, llm-security, blue-team, red-team, purple-team]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [enterprise-ai-security-defense, enterprise-ai-red-purple-blue-team, nist-ai-risk-management-framework, mitre-atlas, owasp-genai-security-project]
aliases: ["AI Security"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/ai-security.md"
migration_date: 2026-07-30
domain: Security
knowledge_type: canonical
---

# AI Security

AI Security สำหรับองค์กรครอบคลุมทั้งการป้องกันผู้โจมตีที่ใช้ AI เพิ่มความเร็วและขนาดของการโจมตี และการป้องกันระบบ AI ขององค์กรจาก Prompt Injection, data leakage, poisoning, tool abuse และ supply-chain compromise

## Threat planes

### AI-assisted attacks against the organization

- AI-generated phishing, BEC และ deepfake social engineering
- reconnaissance, vulnerability research และ exploit development ที่เร็วขึ้น
- malware assistance และการประมวลผลข้อมูลที่ขโมยไป
- การสร้างข้อความหลอกลวงเฉพาะบุคคลในปริมาณมาก

### Attacks against organizational AI systems

- Direct/Indirect Prompt Injection
- RAG และ data poisoning
- Sensitive Information Disclosure และ cross-tenant retrieval
- AI Agent, MCP และ tool abuse
- Model/API abuse, denial of service และ cost exhaustion
- Model, dependency, plugin และ dataset supply-chain risk

## Organizational knowledge map

- [[Enterprise AI Security Defense]] — preventive controls, detection, incident response และ roadmap
- [[Enterprise AI Red-Purple-Blue Team]] — วิธีทดสอบอย่างได้รับอนุญาตและเปลี่ยนผล Red Team เป็น Blue Team capability
- [[nist-ai-risk-management-framework|NIST AI RMF]] — governance และ risk management
- [[MITRE ATLAS]] — threat model และ detection mapping
- [[OWASP GenAI Security Project]] — application and agentic AI risks

## Core principles

1. ถือว่า prompt, retrieved content, model output และ tool response เป็น untrusted data
2. ตรวจ authentication และ authorization ด้วย deterministic application controls ไม่มอบให้ LLM ตัดสินเอง
3. ให้ AI Agent และ MCP tools ใช้ least privilege, allowlist และ human approval สำหรับ high-impact actions
4. ห้ามส่ง secrets, customer data, internal IPs หรือข้อมูล Confidential ไปยัง AI ที่ไม่ได้รับอนุมัติ
5. ทำ continuous testing, monitoring, remediation และ retesting เมื่อ model, data, prompt หรือ tools เปลี่ยน

## Security boundary

เนื้อหานี้ใช้เพื่อ authorized defensive learning และการทดสอบระบบภายในที่มี scope เท่านั้น ไม่อนุญาตการ scan, exploit หรือ attack simulation ต่อระบบจริงหรือบุคคลภายนอกโดยไม่มีการอนุมัติ

## Source

- [[Enterprise AI Security Standards Research]] (verified 2026-07-28)
