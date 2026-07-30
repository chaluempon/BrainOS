# Ai_WiKi — Codex Instructions

## Required reading

Before making any change, read:

1. `README.md`
2. `CLAUDE.md`
3. `rules.md`
4. `wiki/index.md`
5. The latest 20–30 entries in `wiki/log.md`
6. `git status --short`

## Existing project protection

- This is an existing Git and Obsidian vault. Never create a new vault or duplicate the current `wiki/` structure.
- Treat `wiki/`, `.archive/`, `CLAUDE.md`, `rules.md`, and all existing notes as user-owned content.
- Do not delete, rename, move, overwrite, or archive existing files without explicit approval.
- Preserve existing user changes shown by Git. Do not revert unrelated changes.
- Create only missing files or folders after reporting the plan.

## Knowledge-base scope

Primary topics are:

- LLM Models and LLM Techniques
- AI Agents, RAG, MCP, evaluation, orchestration
- AI Security and AI governance
- Network and Firewall Security
- Application Security and secure coding
- Blue Team, Red Team, Purple Team
- CVE, threat intelligence, security advisories, and defensive best practices

## Security boundaries

- Use this vault for authorized defensive learning and internal security work only.
- Do not perform scanning, exploitation, attack simulation, or access to systems without explicit authorization and defined scope.
- Never store passwords, API keys, private keys, tokens, internal IP addresses, network diagrams, or customer data in the vault.
- For security content, prioritize impact, detection, mitigation, remediation, assumptions, and references.

## Wiki rules

- Follow the schemas and workflows in `CLAUDE.md` and `rules.md`.
- Preserve raw sources as immutable after ingest.
- Update `wiki/index.md` and append to `wiki/log.md` for every completed ingest or material Wiki change.
- Use Markdown, YAML frontmatter, and Obsidian `[[wikilinks]]`.
- Write explanations in concise Thai; preserve technical terms, model names, CVEs, and tool names in English.
- Verify internal links and relevant configuration files before reporting completion.
