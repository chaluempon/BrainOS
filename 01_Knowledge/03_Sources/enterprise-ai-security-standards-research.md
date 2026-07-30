---
title: "Enterprise AI Security Standards Research"
type: "source"
source_type: "research"
date: 2026-07-28
verified_date: 2026-07-28
tags: [ai-security, ai-governance, llm-security, red-team, purple-team, blue-team]
entities: [nist-ai-risk-management-framework, mitre-atlas, owasp-genai-security-project]
related_topics: [ai-security, enterprise-ai-security-defense, enterprise-ai-red-purple-blue-team]
contested: false
aliases: ["Enterprise AI Security Standards Research"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
migrated_from: "wiki/sources/enterprise-ai-security-standards-research.md"
migration_date: 2026-07-30
domain: Sources
knowledge_type: source
---

# Enterprise AI Security Standards Research

**Source Type:** Web research synthesis

**Date:** 2026-07-28

**Author:** AI-assisted research session

**Raw manifest:** `raw/enterprise-ai-security-research-2026-07-28.md`

## Scope

รวบรวมมาตรฐานและคำแนะนำสำหรับสองคำถาม: การป้องกันองค์กรจากผู้โจมตีที่ใช้ AI และการทำ authorized AI Red Team เพื่อพัฒนา Purple/Blue Team controls, detections และ incident response

## Key findings

- AI เพิ่มความเร็ว ปริมาณ และความแนบเนียนของ reconnaissance, vulnerability research, social engineering, phishing และการประมวลผลข้อมูลที่ขโมยไป แต่ traditional cybersecurity controls ยังเป็นฐานสำคัญ
- ระบบ AI เพิ่ม attack surface เฉพาะ ได้แก่ Prompt Injection, sensitive data disclosure, RAG/data poisoning, excessive agency, MCP/tool abuse, supply chain และ unbounded consumption
- AI security ต้องเชื่อม governance, architecture, identity, data protection, monitoring, response และ continuous testing
- Red Team findings ต้องถูกแปลงเป็น preventive control, SIEM detection, playbook และ regression test ผ่าน Purple Team
- fixed guardrails และ automated testing เพียงอย่างเดียวไม่เพียงพอ ต้องมี continuous monitoring, human validation และ retesting

## Primary references

### NIST

- NIST AI Risk Management Framework: https://www.nist.gov/itl/ai-risk-management-framework
- NIST AI 600-1 — Generative AI Profile: https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence
- NIST AI 100-2 E2025 — Adversarial Machine Learning taxonomy: https://csrc.nist.gov/pubs/ai/100/2/e2025/final
- NIST Cybersecurity Framework 2.0: https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20
- Continuous red team/monitor/update security model, 2026: https://www.nist.gov/news-events/news/2026/06/nist-mathematical-proof-supports-transition-continuous-monitor-and-update
- Post-deployment AI monitoring challenges, 2026: https://www.nist.gov/news-events/news/2026/03/new-report-challenges-monitoring-deployed-ai-systems
- NIST Dioptra: https://pages.nist.gov/dioptra/

### MITRE and OWASP

- MITRE ATLAS: https://atlas.mitre.org/
- OWASP Top 10 for LLM Applications: https://genai.owasp.org/llm-top-10/
- OWASP GenAI Red Teaming Guide: https://genai.owasp.org/resource/genai-red-teaming-guide/

### Government secure-development and threat guidance

- UK NCSC — Impact of AI on cyber threat to 2027: https://www.ncsc.gov.uk/report/impact-ai-cyber-threat-now-2027
- NCSC/CISA and international partners — Secure AI System Development: https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development/introduction
- CISA — Phishing-resistant MFA: https://www.cisa.gov/audiences/small-and-medium-businesses/secure-your-business/require-multifactor-authentication

### Controlled testing tools

- Microsoft PyRIT: https://github.com/microsoft/PyRIT
- NVIDIA garak: https://github.com/NVIDIA/garak

## Entities mentioned

- [[nist-ai-risk-management-framework|NIST AI RMF]] — governance and AI risk-management framework
- [[MITRE ATLAS]] — AI threat modeling and detection mapping
- [[OWASP GenAI Security Project]] — LLM/GenAI/Agentic AI application risks and testing guidance

## Related topics

- [[AI Security]]
- [[Enterprise AI Security Defense]]
- [[Enterprise AI Red-Purple-Blue Team]]

## Evidence limitations

- AI threats, model behavior และ tool capabilities เปลี่ยนเร็ว ต้องตรวจ version/date ก่อนนำไปใช้
- NIST AI RMF 1.0 อยู่ระหว่างการปรับปรุง ณ วันที่ตรวจสอบ จึงควรติดตาม revision ใหม่
- Tools และ scanners อาจให้ false positives/false negatives; ผลต้องได้รับ human validation
- ไม่มีการ scan, exploit หรือ attack simulation ต่อระบบใดในการรวบรวมข้อมูลนี้
