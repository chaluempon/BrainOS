# BrainOS Dependencies

**Document Status:** Foundation Dependency Inventory  
**Last Updated:** 2026-06-21

BrainOS currently has no runtime dependencies. This inventory tracks governance, documentation, tooling, and future project dependencies.

## Current Dependency Inventory

| Dependency | Type | Purpose | Owner | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| Markdown | Documentation format | Standard format for BrainOS documents and templates. | BrainOS Governance Owner | Active | Required for all foundation documents. |
| BrainOS Global Rules | Governance standard | Single source of truth for governed AI work. | BrainOS Governance Owner | Active | Defined in `GLOBAL_RULES.md`. |
| AI engineering tools | Tooling class | Tools such as Codex, Claude Code, Cursor, Windsurf, OpenHands, Roo, and Cline must follow BrainOS rules when used on governed work. | Tool owner or project owner | Governed | Tool-specific behavior must not override BrainOS standards. |

## Future Dependency Fields

Future dependencies should document:

- Name.
- Type.
- Purpose.
- Owner.
- Version or reference where applicable.
- Related project, module, agent, or workflow.
- Security considerations.
- Operational status.
- Last reviewed date.

## Dependency Rules

- Do not introduce undocumented runtime dependencies into BrainOS.
- Do not store credentials in dependency records.
- Review dependencies when project scope, agent tools, or integrations change.
