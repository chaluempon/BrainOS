# BrainOS Agent Registry

**Document Status:** Registry Structure  
**Last Updated:** 2026-06-21

The Agent Registry is the authoritative inventory of AI agents governed by BrainOS. Registration does not imply implementation. It defines ownership, purpose, scope, inputs, outputs, dependencies, tools, and operational status.

## Registry Fields

| Field | Description |
| --- | --- |
| Agent Name | Unique name of the agent. |
| Purpose | Primary reason the agent exists. |
| Owner | Human, team, or governance owner accountable for the agent. |
| Inputs | Approved information the agent may consume. |
| Outputs | Expected deliverables or responses. |
| Dependencies | Required documents, tools, models, data sources, or governance artifacts. |
| Tools | Approved tools or execution environments. |
| Status | Proposed, Draft, Review, Approved, Active, Paused, Retired. |
| Last Updated | Date of the most recent registry update. |

## Registry

| Agent Name | Purpose | Owner | Inputs | Outputs | Dependencies | Tools | Status | Last Updated |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| BrainOS Governance Steward | Reviews whether project artifacts comply with BrainOS standards. | BrainOS Governance Owner | Charters, architecture docs, templates, registries | Review notes, compliance gaps, recommended updates | `GLOBAL_RULES.md`, `PROJECT_CHARTER.md` | AI assistant, markdown review tools | Proposed | 2026-06-21 |
| Documentation Curator | Preserves reusable project knowledge and documentation updates. | Knowledge Owner | Decisions, summaries, lessons learned, project documents | Knowledge base entries, documentation change proposals | `KNOWLEDGE_BASE/`, `DOCS/` | AI assistant, markdown editor | Proposed | 2026-06-21 |
| Workflow Designer | Drafts workflow documentation using BrainOS workflow standards. | Process Owner | Workflow requirements, triggers, inputs, outputs | Workflow documents, failure-handling notes | `TEMPLATES/WORKFLOW_TEMPLATE.md`, `WORKFLOWS/` | AI assistant, markdown editor | Proposed | 2026-06-21 |

## Registration Rules

- Every active or proposed agent must have one registry row.
- Tool access must be explicit.
- Data access must be explicit.
- Ownership must be assigned before operational use.
- Status must be updated when scope, tools, or responsibilities change.
