# Ai_WiKi Migration Map

**Status:** Owner-authorized baseline
**Method:** Verified file-level copy; source retained; migrated knowledge `draft`/`internal`.

| Source | Destination | Action |
| --- | --- | --- |
| `wiki/topics/*.md` | `01_Knowledge/02_Canonical/<domain>/` | Copy, add migration metadata, preserve content and links |
| `wiki/entities/*.md` | `01_Knowledge/04_Glossary/` | Copy, add aliases/status/access metadata |
| `wiki/sources/*.md` | `01_Knowledge/03_Sources/` | Copy and preserve citation metadata |
| templates | `01_Knowledge/90_Templates/Legacy_Ai_WiKi/` | Preserve as legacy templates |
| `raw/` | `09_Inbox/Knowledge_Import/` | Copy; never mark approved |
| `.archive/` | `10_Archive/AI_Wiki_Original_Sources/` | Copy immutable originals |
| `rules.md`, `CLAUDE.md`, `AGENTS.md` | `10_Archive/Ai_WiKi_Operational_Documents/` | Preserve originals; reusable rules are represented in BKOS standards |
| loose root notes and `Welcome.md` | `09_Inbox/Knowledge_Import/Loose_Root_Notes/` | Preserve for review; do not create duplicate canonical notes |
| `.obsidian` portable configs | `01_Knowledge/.obsidian/` | Copy `app`, `appearance`, `core-plugins`, `graph`; exclude `workspace.json` |
| scripts | `10_Archive/Ai_WiKi_Scripts/` | Preserve only; do not execute until path/security review |
| `.git`, `.kilo`, `node_modules`, `.DS_Store` | No migration | Repository/cache/system data |

`project-status-handoff.md` is project history, not general canonical knowledge; it is preserved under `02_Projects/Ai_WiKi/Legacy_Project_Status.md`.
