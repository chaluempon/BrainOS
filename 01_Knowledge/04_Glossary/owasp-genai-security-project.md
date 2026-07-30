---
title: "OWASP GenAI Security Project"
type: "concept"
tags: [ai-security, llm-security, application-security, owasp, agentic-ai]
created: 2026-07-28
updated: 2026-07-28
source_count: 1
related: [ai-security, enterprise-ai-security-defense, enterprise-ai-red-purple-blue-team, nist-ai-risk-management-framework, mitre-atlas]
aliases: ["OWASP GenAI Security Project"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/owasp-genai-security-project.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# OWASP GenAI Security Project

OWASP GenAI Security Project รวบรวมความเสี่ยงและแนวทางป้องกันสำหรับ LLM, Generative AI และ Agentic AI รวมถึง OWASP Top 10 for LLM Applications และ GenAI Red Teaming Guide

## ความเสี่ยงหลักสำหรับองค์กร

- Prompt Injection และ Indirect Prompt Injection
- Sensitive Information Disclosure
- Supply Chain และ Data/Model Poisoning
- Improper Output Handling
- Excessive Agency และการใช้ tools เกินสิทธิ์
- System Prompt Leakage
- Vector/Embedding weaknesses, misinformation และ unbounded consumption

## การใช้ในองค์กร

- ใช้เป็น application-security checklist สำหรับ AI gateway, RAG, Agents และ MCP
- แปลงความเสี่ยงเป็น abuse cases, acceptance criteria และ regression tests
- ใช้ Red Teaming Guide ครอบคลุม model, implementation, infrastructure และ runtime behavior

## Related topics

- [[AI Security]]
- [[Enterprise AI Security Defense]]
- [[Enterprise AI Red-Purple-Blue Team]]
- [[nist-ai-risk-management-framework|NIST AI RMF]]
- [[MITRE ATLAS]]

## Source

- [[Enterprise AI Security Standards Research]] (verified 2026-07-28)
