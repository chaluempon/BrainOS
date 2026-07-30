# Ai_WiKi Migration Inventory

**Assessment date:** 2026-07-30
**Source:** `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/Ai_WiKi`

Excluding `.git`, `.kilo`, and `node_modules`: 81 files — 70 Markdown, 6 JSON, 2 PowerShell, 1 URL pointer, and 2 extensionless files. The maintained wiki contains 31 entities, 16 topics, and 5 source records (52 indexed pages), plus templates and operational documents.

Obsidian has five core configuration files and no community-plugin directory. `workspace.json` is machine-specific and will not migrate. Existing scripts require path/security review. Git has modified and untracked owner content; all is preserved in the source and restore point.

Risks: duplicate loose root notes, one topic without frontmatter, legacy Windows paths, machine-specific workspace state, template links that resemble unresolved links, and two secret-pattern matches requiring manual review (not treated as confirmed secrets).
