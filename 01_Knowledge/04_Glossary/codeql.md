---
title: "CodeQL"
type: "concept"
tags: [security, static-analysis, github, ci]
created: 2026-05-08
updated: 2026-05-08
source_count: 1
related: [secure-software-engineering-checklist, software-engineering-project-standard]
aliases: ["CodeQL"]
category: Migrated_Ai_WiKi
status: draft
access_level: internal
source_type: migrated_ai_wiki
migrated_from: "wiki/entities/codeql.md"
migration_date: 2026-07-30
domain: Glossary
knowledge_type: glossary
---

# CodeQL

CodeQL is GitHub's semantic code analysis engine for finding security vulnerabilities and code quality issues.

## Definition

CodeQL analyzes source code as data and runs queries that detect vulnerable patterns. In GitHub repositories, the CodeQL Action can upload findings to code scanning alerts and pull requests.

## When To Use

- Repositories hosted on GitHub.
- APIs, web applications, services, CLIs, and libraries written in supported languages.
- Projects that need automated security checks in CI.

## How AI Agents Should Use It

- Add CodeQL when the language is supported and the repository uses GitHub Actions.
- Keep it in `.github/workflows/codeql.yml` or combine it into the main security workflow.
- Do not treat CodeQL as the only security control. Pair it with tests, reviews, dependency scanning, and secure design.

## Related Topics

- [[Secure Software Engineering Checklist]]
- [[Software Engineering Project Standard]]

## Sources

- [[Software Engineering Standards Research]] (2026-05-08)
