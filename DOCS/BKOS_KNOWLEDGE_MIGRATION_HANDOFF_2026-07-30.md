# BKOS Knowledge Migration — Handoff and Planning Record

**Status:** Planning / awaiting owner approval
**Date:** 2026-07-30
**Owner:** BrainOS Owner
**Audience:** Owner, Hermes, Codex, and authorized future AI agents
**Scope:** Planning only. This document does not authorize migration, deletion, commits, pushes, or runtime deployment.

## 1. Purpose

The owner wants to consolidate the experimental `Ai_WiKi` project into `BrainOS` so that BrainOS becomes the single central library for humans and AI agents.

The desired internal architecture name is **BrainOS Knowledge Operating System (BKOS)**. The product and repository name remains **BrainOS**.

The objective is a durable structure intended to remain useful for approximately 5–10 years, with clear separation between governance, curated knowledge, projects, agents, workflows, prompts, tools, operational memory, and archives.

## 2. Repositories and Their Boundaries

### BrainOS

**Path:** `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS`

BrainOS is the canonical repository for:

- Global rules and governance.
- Knowledge standards and documentation standards.
- The shared Obsidian knowledge library after migration.
- Agent definitions, prompts, workflows, templates, ADRs, and organizational knowledge.
- Portfolio-level project documentation and links to project repositories.

BrainOS is **not** the home for application runtime code, databases, production services, Docker runtime state, or production infrastructure unless the owner explicitly changes the existing repository charter.

`GLOBAL_RULES.md` at the repository root is an existing canonical entry point and must remain there to avoid breaking the existing raw GitHub URL and downstream agent instructions.

### BrainOS_Platform

**Path:** `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS_Platform`

BrainOS_Platform is an existing Python/FastAPI runtime project. Its documented role is an AI workforce orchestrator that owns:

- Gateway, task routing, scheduling, and worker registry.
- Local LLM role management and HTTP integration to Micro_LLM.
- Judge flow, security/governance enforcement, audit, and observability.
- Future memory and RAG retrieval.

It already documents the intended boundary: BrainOS is read-only governance, BrainOS_Platform is runtime orchestration, and Micro_LLM remains a separate local LLM backend called through HTTP.

### Micro_LLM

Micro_LLM is the existing local LLM backend (for example LiteLLM, Smart Router, and Ollama workers). It is separate from both BrainOS governance and BrainOS_Platform runtime orchestration.

## 3. Long-Term Architecture

```text
BrainOS (canonical source of truth)
  ├── Global Rules / Governance
  ├── Curated Knowledge Library / Obsidian Vault
  ├── Agent definitions, prompts, workflows, templates
  └── Project portfolio documents and ADRs

BrainOS_Platform (runtime orchestrator)
  ├── Gateway / Router / Scheduler / Worker Roles / Judge
  ├── Read-only knowledge and RAG connector
  ├── Task memory and audit trail
  └── Derived RAG index / vector store

Micro_LLM (local model backend)
  └── Local model serving, called through HTTP
```

The three data classes must remain separate:

| Data class | Canonical location | Meaning |
| --- | --- | --- |
| Curated knowledge | `BrainOS/01_Knowledge/` | Long-lived, sourced, reviewed information usable across projects. |
| RAG index | BrainOS_Platform persistent runtime storage | Derived/cache data that can be regenerated from the canonical library. |
| Task memory and audit | BrainOS_Platform runtime storage | Task-scoped context, execution history, and audit records; not automatically promoted to knowledge. |

## 4. Storage and Container Decision

Both `BrainOS` and `BrainOS_Platform` source repositories live on the owner’s machine and are backed up/versioned through Git remote.

- BrainOS and the Obsidian vault remain files on the owner’s machine. They must not be placed solely in a disposable container.
- BrainOS_Platform source code remains on the owner’s machine; its runtime may run in containers on the same machine.
- Docker/container runtime state such as vector indexes, databases, audit stores, and queues should use persistent volumes or local runtime storage outside OneDrive.
- OneDrive is suitable for documentation and Git working copies, but not preferred for high-churn databases, vector indexes, or container runtime state.
- Secrets must stay outside Git and container images, using environment injection, local `.env` files excluded by Git, or a future secret manager.

## 5. Target BrainOS Structure

```text
BrainOS/
├── README.md
├── AGENTS.md
├── GLOBAL_RULES.md
├── 00_System/
│   ├── Global_Rules/
│   ├── Standards/
│   ├── Templates/
│   ├── AI_Profiles/
│   └── Config/
├── 01_Knowledge/
│   ├── .obsidian/
│   ├── 00_HOME.md
│   ├── AGENTS.md
│   ├── 01_Indexes/
│   ├── 02_Canonical/
│   │   ├── AI_and_Agents/
│   │   ├── Architecture/
│   │   ├── Data_and_RAG/
│   │   ├── Engineering/
│   │   ├── Infrastructure/
│   │   ├── MCP/
│   │   ├── Security/
│   │   └── Business_and_Operations/
│   ├── 03_Sources/
│   ├── 04_Glossary/
│   ├── 90_Templates/
│   └── 99_Deprecated/
├── 02_Projects/
├── 03_Agents/
├── 04_Prompts/
├── 05_Workflows/
├── 06_Tools/
├── 07_Documents/
├── 08_Memory/
├── 09_Inbox/
└── 10_Archive/
```

Do not create empty `apps`, `services`, `scripts`, or `tests` merely to match an abstract diagram. Preserve existing folders such as `MODULES/` during the first migration and create an approved mapping before any rename or move.

## 6. AI Library Access Contract

Root `AGENTS.md` and `01_Knowledge/AGENTS.md` should instruct every agent to:

1. Read `GLOBAL_RULES.md` first.
2. Read `01_Knowledge/00_HOME.md` and the relevant indexes before detailed notes.
3. Retrieve only relevant canonical notes; do not load the entire vault unnecessarily.
4. Treat `approved` and `published` notes as the primary factual basis. Treat `draft` and `under_review` notes as supporting context only.
5. Cite the canonical note and source record for material factual claims.
6. Not edit knowledge directly unless the agent has an authorized Knowledge Curator or Librarian role.
7. Not send `confidential` or `restricted` material to external AI, external RAG, or external connectors without authorization.

## 7. Ai_WiKi Current State

**Source path:** `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/Ai_WiKi`

Observed structure:

- `wiki/entities/` — approximately 31 entity pages.
- `wiki/topics/` — approximately 16 topic pages.
- `wiki/sources/` — 5 source pages.
- `wiki/index.md` — reports 52 total pages.
- `wiki/log.md` — append-only activity log.
- `raw/` — unprocessed source inputs.
- `.archive/` — processed originals.
- `.obsidian/` — existing vault configuration.
- `rules.md`, `CLAUDE.md`, and `AGENTS.md` — existing knowledge-processing instructions.
- `scripts/` — PowerShell helpers; current scripts contain hard-coded legacy Windows paths and need review before reuse.

The current working tree contains user changes and untracked files. Preserve all of them. Do not delete the source repository automatically.

## 8. Full Migration Mapping

The owner is open to a one-time full structural migration because Ai_WiKi has limited adoption so far. This must still be safe and non-destructive.

| Ai_WiKi source | BrainOS destination | Notes |
| --- | --- | --- |
| `wiki/topics/` | `01_Knowledge/02_Canonical/<domain>/` | One canonical note per topic; choose domain through an approved migration map. |
| `wiki/entities/` | `01_Knowledge/04_Glossary/` | Preserve aliases and incoming wiki links. |
| `wiki/sources/` | `01_Knowledge/03_Sources/` | Preserve citation and original-source metadata. |
| `raw/` | `09_Inbox/Knowledge_Import/` | Unprocessed material is not approved knowledge. |
| `.archive/` | `10_Archive/AI_Wiki_Original_Sources/` | Retain original processed source material. |
| `rules.md`, `CLAUDE.md`, `AGENTS.md` | `00_System/`, `03_Agents/`, `05_Workflows/` | Split reusable policies deliberately; archive original documents. |
| reusable scripts | `06_Tools/` | Only after path/security review. |
| `.obsidian/` | `01_Knowledge/.obsidian/` | Merge safely; avoid copying machine-specific `workspace.json` unless necessary. |
| `.kilo/node_modules`, caches, local dependencies | do not migrate | Not knowledge assets. |

## 9. Migration Method and Required Validation

Perform the full migration in one approved project but use this internal sequence:

1. Inspect both repositories and read their authoritative instructions.
2. Produce inventory: folder/file counts, file types, current Git state, links, attachments, configuration, plugins, duplicate names, and sensitive-data risks.
3. Create a backup/snapshot or branch where possible.
4. Create and obtain approval for the Migration Map.
5. Copy into staging; do not delete `Ai_WiKi`.
6. Normalize filenames, frontmatter, folder placement, source references, wiki links, and indexes.
7. Create a Migration Manifest recording source path, destination path, file size, SHA-256, date, validation status, renames, and link updates.
8. Validate: manifests, links, duplicates, Thai encoding, attachments, Obsidian compatibility, metadata, index counts, secret scans, and Git diff.
9. Cut over BrainOS `01_Knowledge` as the active vault only when validation passes.
10. Retain `Ai_WiKi` untouched until the owner explicitly authorizes archive or deletion.

## 10. Required BKOS Documents

At minimum, create real, useful content for:

- `00_System/README.md`
- Knowledge, Markdown, Metadata, and Obsidian standards
- Knowledge note, source note, ADR, and lesson-learned templates
- `01_Knowledge/00_HOME.md` and indexes
- Root and knowledge-level agent instructions
- Knowledge Pipeline workflow, agent roles, and review checklist
- `07_Documents/Architecture/BKOS_Architecture.md`
- `07_Documents/Architecture/RAG_Readiness_Standard.md`
- `07_Documents/Policies/Knowledge_Governance.md`
- `07_Documents/ADR/ADR-0001-BrainOS-Knowledge-Operating-System.md`
- Migration Inventory, Map, Manifest, and Report
- `08_Memory/README.md`, `09_Inbox/README.md`, and `10_Archive/README.md`

For MCP in the foundation phase, create only an index, README, and sourced backlog. Do not generate many technical MCP notes or date/version-specific claims without verified official sources.

## 11. Knowledge-to-Platform Contract to Define Later

Before BrainOS_Platform implements RAG over the central library, define a separate contract covering:

- The exact knowledge source location (Git checkout, approved read-only mount, or release bundle).
- Read-only access and least-privilege rules.
- Which knowledge statuses are eligible for indexing.
- Knowledge release/version identifier used by each index build.
- Access-level filtering before retrieval and before cloud escalation.
- Citation requirements from retrieved chunk back to canonical note/source.
- Rebuild, invalidation, and backup procedures for derived RAG indexes.
- The rule that runtime task memory is not automatically promoted into canonical knowledge.

## 12. Master Prompt Status

The working Master Prompt is stored at:

`/Users/dojo/.codex/attachments/97a6be5a-4d2e-44ed-a270-5cc765b2aab6/pasted-text.txt`

It has already been amended with:

- Repository-charter safeguard: do not assume BrainOS contains runtime/source code.
- Full migration and cutover principles.
- Detailed knowledge target structure and Ai_WiKi mapping.
- Obsidian vault-root guidance.
- AI library access contract.
- Migration manifest/checksum requirement.
- A prohibition on empty runtime folder scaffolding.

Before execution, the prompt should additionally include:

1. The three-part boundary: BrainOS = governance/knowledge; BrainOS_Platform = orchestration runtime; Micro_LLM = local model backend.
2. The Knowledge-to-Platform Contract requirements from section 11.
3. A constrained MCP foundation requirement (index/README/backlog only until sourced).
4. Migration completion criteria: every manifest item accounted for, links valid, index counts correct, vault opens, original Ai_WiKi retained, Git diff reviewed, and no secret exposure.

## 13. Suggested Agent Team After Approval

Do not create or run this team until the owner approves scope and the final Master Prompt.

| Role | Bounded responsibility |
| --- | --- |
| Assessment and Migration Auditor | Inventory, link checks, manifest, risk report; no moves/deletes. |
| BKOS Foundation Architect | Create non-destructive standards, templates, governance, ADR, and root navigation. |
| Knowledge Migration Curator | Apply approved mapping, normalize notes, preserve sources and links. |
| Validation and Security Reviewer | Verify manifest, links, metadata, duplicate notes, secret exposure, and Git status. |
| Platform Integration Architect | Define only the future read-only Knowledge-to-Platform contract; no runtime implementation unless separately approved. |

All agents must preserve unrelated user changes, operate within assigned boundaries, and report proposed changes before any destructive or broad structural action.

## 14. Owner Decisions Needed Before Work Begins

1. Approve the long-term boundary: BrainOS is governance/knowledge; BrainOS_Platform is runtime; Micro_LLM is backend.
2. Approve the target BrainOS folder model in section 5.
3. Approve full migration mapping in section 8.
4. Decide whether Ai_WiKi migration will preserve Git history through subtree/import, or use a verified file-level migration plus archive of the original repository.
5. Decide the first classification/status defaults for migrated knowledge (for example `draft` versus `published`).
6. Review and finalize the Master Prompt additions in section 12.
7. Explicitly authorize the first implementation phase and the creation of an agent team.

## 15. Explicit Non-Actions Until Approval

- Do not move or delete Ai_WiKi files.
- Do not delete or rename existing BrainOS structures.
- Do not change BrainOS_Platform runtime behavior.
- Do not create containers, databases, vector stores, external services, or cloud resources.
- Do not commit or push changes without separate authorization.
