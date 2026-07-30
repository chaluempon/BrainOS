---
title: "MITRE ATLAS"
type: "concept"
tags: [ai-security, threat-modeling, adversarial-ml, detection-engineering, mitre]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [ai-security, enterprise-ai-security-defense, enterprise-ai-red-purple-blue-team, nist-ai-risk-management-framework, owasp-genai-security-project]
aliases: ["MITRE ATLAS"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/mitre-atlas.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# MITRE ATLAS

MITRE ATLAS (Adversarial Threat Landscape for Artificial-Intelligence Systems) เป็น knowledge base สำหรับ tactics, techniques, mitigations และ case studies ของการโจมตีระบบ AI ครอบคลุม Predictive AI, Generative AI และ Agentic AI

## การใช้ในองค์กร

- ใช้สร้าง AI threat model และ attack scenario ที่มีรหัสอ้างอิงสม่ำเสมอ
- map ผล AI Red Team ไปยัง preventive controls และ SIEM detections
- ใช้ Purple Team เชื่อม attack path, telemetry, alert และ response playbook
- ติดตาม coverage ของ detection และ mitigation ตาม technique

## ข้อควรระวัง

ATLAS เป็นฐานความรู้ ไม่ได้ยืนยันว่าทุก technique เกิดกับทุกระบบ องค์กรต้องเลือกตาม architecture, data flow, trust boundary และสิทธิ์ของ AI Agent

## Related topics

- [[AI Security]]
- [[Enterprise AI Security Defense]]
- [[Enterprise AI Red-Purple-Blue Team]]
- [[nist-ai-risk-management-framework|NIST AI RMF]]
- [[OWASP GenAI Security Project]]

## Source

- [[Enterprise AI Security Standards Research]] (verified 2026-07-28)
