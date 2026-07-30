---
title: "Enterprise AI Security Defense"
type: "topic"
tags: [ai-security, enterprise-security, llm-security, ai-governance, detection, incident-response]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [ai-security, enterprise-ai-red-purple-blue-team, nist-ai-risk-management-framework, mitre-atlas, owasp-genai-security-project]
aliases: ["Enterprise AI Security Defense"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/enterprise-ai-security-defense.md"
migration_date: 2026-07-30
domain: Security
knowledge_type: canonical
---

# Enterprise AI Security Defense

แนวทางป้องกันองค์กรจาก AI-assisted cyberattacks และช่องโหว่ของระบบ AI โดยผสาน traditional cybersecurity baseline เข้ากับ AI-specific controls

## Priority controls: 0–30 days

### Governance and inventory

- จัดทำ inventory ของ AI SaaS, models, APIs, RAG, Agents, MCP servers, tools, data stores และ owners
- ออก AI Acceptable Use Policy และ approved-service registry
- ระบุ data classification, retention, training use และ vendor responsibilities
- กำหนด risk owner และ approval gate สำหรับ use case ที่เข้าถึงข้อมูลหรือทำ high-impact action

### Identity and conventional defenses

- ใช้ phishing-resistant MFA, SSO, Conditional Access และ separate admin accounts
- ปิด legacy authentication และตรวจ OAuth applications/API tokens
- patch internet-facing systems ตามความเสี่ยง
- ใช้ EDR/XDR, centralized logging, network segmentation และ tested immutable backups
- ใช้ dual approval และ out-of-band verification สำหรับการโอนเงินหรือเปลี่ยนข้อมูลสำคัญ เพื่อรับมือ BEC/deepfake

## AI application controls: 30–90 days

### AI gateway and data protection

- บังคับ AI traffic ผ่าน approved gateway ที่มี authentication, authorization, DLP, rate limit และ audit logging
- ไม่เก็บ secrets หรือ authorization logic ไว้ใน System Prompt
- กรองข้อมูลตาม classification ก่อนส่งออกและตรวจ output ก่อนแสดงหรือส่งต่อ
- กำหนด token, request และ cost quotas พร้อม circuit breaker

### RAG, Agents and MCP

- ตรวจ ACL ก่อน retrieval และก่อนแสดงผล; ป้องกัน cross-user/cross-tenant leakage
- เก็บ source provenance, hash และ ingestion approval สำหรับเอกสาร RAG
- quarantine และ sanitize เนื้อหาจากเว็บ อีเมล PDF หรือแหล่งที่ไม่เชื่อถือ
- ให้ Agent แต่ละตัวใช้ service identity แยกและ short-lived credentials
- ใช้ tool/MCP allowlist, parameter schema, per-action authorization และ human approval สำหรับ destructive หรือ external actions
- จำกัด network egress และแยก memory ตาม user, tenant และ sensitivity

### Secure development and supply chain

- validate/encode model output ก่อนใช้กับ SQL, shell, HTML หรือ downstream APIs
- pin model, dependency, container และ plugin versions; ตรวจ hash/signature และจัดทำ SBOM
- เพิ่ม abuse cases สำหรับ Prompt Injection, data leakage, tool abuse, RAG poisoning และ cost exhaustion ใน CI/evaluation pipeline

## Detection engineering

- prompt หรือ retrieved content มี instruction-like patterns, obfuscation หรือ encoding ผิดปกติ
- AI Agent เรียก high-risk tool, domain หรือ action ที่ user ไม่เคยใช้
- retrieval ข้ามสิทธิ์หรือดึงข้อมูลจำนวนมากผิดปกติ
- DLP/canary ตรวจพบข้อมูลต้องห้ามใน model output หรือ outbound request
- token/API usage, latency หรือค่าใช้จ่ายเพิ่มผิดปกติ
- model, MCP server, dependency, tool definition หรือ configuration hash เปลี่ยนโดยไม่มี change record
- OAuth consent, service account และ geographic access ผิดปกติ

## Incident response

1. หยุดหรือจำกัด Agent/tools และ revoke affected credentials
2. แยก session, RAG source หรือ model endpoint ที่สงสัย
3. เก็บ evidence: identity, prompt metadata, retrieval sources, model/version, tool calls และ downstream actions โดยไม่เก็บ secrets เกินจำเป็น
4. ประเมิน data exposure และ business impact
5. แก้ policy/control แล้ว retest ด้วยกรณีเดิมและกรณีใกล้เคียง
6. อัปเดต detection, playbook, risk register และผู้มีส่วนได้เสีย

## Metrics

- AI asset inventory และ logging coverage
- phishing-resistant MFA coverage โดยเฉพาะ privileged accounts
- unauthorized tool calls ที่ถูกป้องกัน
- data-leak tests ที่ถูก block
- Mean Time to Detect/Respond และ restore-test success rate
- findings ที่แก้และผ่าน regression retest

## Related topics

- [[AI Security]]
- [[Enterprise AI Red-Purple-Blue Team]]
- [[nist-ai-risk-management-framework|NIST AI RMF]]
- [[MITRE ATLAS]]
- [[OWASP GenAI Security Project]]

## Source

- [[Enterprise AI Security Standards Research]] (verified 2026-07-28)
