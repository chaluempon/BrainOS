---
title: "Enterprise AI Red-Purple-Blue Team"
type: "topic"
tags: [ai-security, red-team, purple-team, blue-team, detection-engineering, authorized-testing]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [ai-security, enterprise-ai-security-defense, nist-ai-risk-management-framework, mitre-atlas, owasp-genai-security-project]
aliases: ["Enterprise AI Red-Purple-Blue Team"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/topics/enterprise-ai-red-purple-blue-team.md"
migration_date: 2026-07-30
domain: Security
knowledge_type: canonical
---

# Enterprise AI Red-Purple-Blue Team

โปรแกรม AI Red Team สำหรับองค์กรควรเปลี่ยนผลการทดสอบเป็น preventive controls, detection rules, incident playbooks และ regression tests ผ่าน Purple Team ไม่ใช่จบที่รายงานช่องโหว่

## Authorization and safety gate

ก่อนทดสอบต้องมี system owner, scope, test accounts, permitted techniques, schedule, stop conditions, rollback, emergency contact และ data-handling rules ที่อนุมัติแล้ว

- เริ่มใน isolated lab หรือ staging และใช้ synthetic data/mock tools
- production testing ต้องได้รับอนุมัติเพิ่มเติมและมี monitoring/rollback พร้อม
- ห้ามใช้ real credentials, customer data หรือ target ภายนอก
- ตรวจ vendor terms ก่อนทดสอบ hosted model/API
- หยุดทันทีเมื่อมีผลกระทบเกิน scope หรือพบข้อมูลจริงที่ไม่ควรเข้าถึง

## Testing domains

แนวทาง OWASP แบ่ง AI Red Teaming เป็น model evaluation, implementation testing, infrastructure assessment และ runtime behavior analysis สำหรับองค์กรควรเพิ่ม business-process exercises เช่น BEC/deepfake verification ด้วย

| Authorized scenario | Red Team objective | Blue Team outcome |
|---|---|---|
| Direct Prompt Injection | ตรวจว่า policy ถูก override หรือไม่ | input policy, authorization และ detection correlation |
| Indirect Prompt Injection | ทดสอบคำสั่งใน controlled web/PDF/email/RAG content | quarantine, provenance, sanitization และ source monitoring |
| Sensitive Data Disclosure | ใช้ synthetic canary ตรวจ leakage/cross-tenant access | retrieval ACL, DLP และ canary alerts |
| Excessive Agency | ใช้ mock tool ตรวจการเรียกเกินสิทธิ์ | allowlist, least privilege, human approval และ action alerts |
| MCP/Tool Poisoning | เปลี่ยน controlled tool metadata/config ใน lab | approved registry, signed config และ hash monitoring |
| RAG Poisoning | ingest เอกสารสังเคราะห์ที่ผิดหรือมีคำสั่งแฝง | approval workflow, provenance และ index-change detection |
| Improper Output Handling | ตรวจ output ที่เข้าสู่ mock downstream service | schema validation, encoding และ safe APIs |
| Supply-chain Change | จำลอง unapproved model/plugin hash ใน test registry | version pinning, SBOM, signature และ drift alert |
| Unbounded Consumption | ทดสอบภายใน quota ของ test tenant | rate limit, budget, circuit breaker และ cost alert |
| AI-assisted BEC/deepfake | tabletop หรือ mock campaign ที่ไม่เก็บ credentials | out-of-band verification, dual approval และ reporting playbook |

## Operating cycle

1. **Threat model:** map data flow และ trust boundaries กับ [[MITRE ATLAS]] และ [[OWASP GenAI Security Project]]
2. **Test design:** กำหนด expected secure behavior, evidence, severity criteria และ telemetry ที่ต้องเห็น
3. **Controlled execution:** ทดสอบเฉพาะ lab/staging ที่อนุมัติและเก็บ model/config version
4. **Purple Team workshop:** อธิบาย attack path และสร้าง control, SIEM rule, triage steps, containment และ recovery
5. **Remediation:** กำหนด owner, due date และ residual risk
6. **Retest:** ทดสอบกรณีเดิมและ variants ที่ปลอดภัย
7. **Continuous assurance:** rerun เมื่อ model, System Prompt, RAG data, MCP server, tool permission หรือ orchestration เปลี่ยน

## Minimum evidence record

- Test ID และ mapped threat/technique
- authorization, target และ environment
- preconditions และ synthetic test data
- expected secure behavior เทียบกับ observed behavior
- model/version, application configuration และ relevant logs
- impact, likelihood, severity และ assumptions
- detection telemetry ที่พบหรือขาด
- mitigation owner, due date, retest result และ residual risk

## Tools for controlled evaluation

- Microsoft PyRIT — orchestration, multi-turn testing และ scoring สำหรับ Generative AI
- NVIDIA garak — probes/detectors สำหรับ model failure modes เช่น injection, leakage และ hallucination
- NIST Dioptra — reproducible และ traceable AI/ML experiments
- MITRE ATLAS — scenario, technique, mitigation และ detection mapping

Automated tools มี false positives/false negatives และไม่แทน human validation, architecture review หรือ traditional penetration testing

## Blue Team metrics

- Attack Success Rate ก่อนและหลัง mitigation
- Prevent/Detect coverage ต่อ scenario และ ATLAS technique
- Mean Time to Detect และ Mean Time to Respond
- high-risk tool calls ที่ block หรือ require approval
- data leakage/cross-tenant tests ที่ป้องกันได้
- false-positive rate และ findings ที่ผ่าน regression retest

## Related topics

- [[AI Security]]
- [[Enterprise AI Security Defense]]
- [[nist-ai-risk-management-framework|NIST AI RMF]]
- [[MITRE ATLAS]]
- [[OWASP GenAI Security Project]]

## Source

- [[Enterprise AI Security Standards Research]] (verified 2026-07-28)
