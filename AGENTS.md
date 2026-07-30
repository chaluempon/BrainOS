# BrainOS Agent Instructions

**Status:** Active
**Owner:** BrainOS Owner
**Updated:** 2026-07-30

## Required reading

1. Read `GLOBAL_RULES.md` first.
2. Read `PROJECT_CHARTER.md` and `SYSTEM_ARCHITECTURE.md` before structural work.
3. For knowledge work, read `01_Knowledge/00_HOME.md` and the relevant index.
4. Preserve existing Git changes and create a verified restore point before modifying the repository.

## Repository boundary

BrainOS is the canonical governance and curated-knowledge repository. It must not contain runtime application code, databases, containers, production services, or secrets. Runtime orchestration belongs to BrainOS_Platform; local model serving belongs to Micro_LLM.

## Change controls

- Use non-destructive, additive changes by default.
- Do not move, rename, overwrite, or delete existing content without an approved migration map.
- Do not commit or push without separate owner authorization.
- Knowledge is edited only by an authorized Curator or Librarian role.
- `approved` and `published` notes are the primary factual basis. `draft` and `under_review` notes are supporting context.
- Never send `confidential` or `restricted` material to external AI, RAG, or connectors without authorization.
