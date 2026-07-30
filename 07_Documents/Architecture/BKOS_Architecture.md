# BrainOS Knowledge Operating System Architecture

**Status:** Approved for foundation implementation
**Date:** 2026-07-30
**Owner:** BrainOS Owner

## Boundary

- **BrainOS:** canonical governance, curated knowledge, agents, prompts, workflows, templates, ADRs, and portfolio documents.
- **BrainOS_Platform:** runtime gateway, routing, scheduling, workers, judge, audit, task memory, and derived RAG storage.
- **Micro_LLM:** local model serving accessed through HTTP.

## Data classes

| Class | Canonical location | Rule |
| --- | --- | --- |
| Curated knowledge | `BrainOS/01_Knowledge` | Long-lived, sourced, reviewed |
| RAG index | BrainOS_Platform persistent runtime storage | Derived and rebuildable |
| Task memory/audit | BrainOS_Platform runtime storage | Task-scoped; no automatic promotion |

BrainOS and its Obsidian vault remain durable host files. High-churn runtime stores stay outside OneDrive and use persistent runtime storage. Secrets remain outside Git and images.
