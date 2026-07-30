# ADR-0001: BrainOS Knowledge Operating System

- **Status:** Accepted
- **Date:** 2026-07-30
- **Owner/Approver:** BrainOS Owner

## Context

Ai_WiKi contains an experimental Obsidian knowledge base while BrainOS is the canonical governance foundation. Maintaining separate centers causes duplicated navigation and unclear authority.

## Decision

BrainOS remains the product/repository name and becomes the single governance and curated-knowledge source. BKOS is the internal architecture name. Ai_WiKi is migrated through verified file-level copy with the original retained. Migrated notes default to `draft`/`internal`. BrainOS_Platform remains runtime orchestration and Micro_LLM remains the model backend.

## Alternatives

- Git subtree/history import: rejected for this migration because it would mix repository history and increase rollback complexity.
- Keep separate vaults: rejected because it preserves split authority.

## Consequences

Benefits: one source of truth, explicit provenance, Obsidian/RAG readiness, clean runtime boundary. Costs: one-time link/metadata normalization and human review backlog. Rollback uses the verified restore point and the untouched Ai_WiKi repository.
