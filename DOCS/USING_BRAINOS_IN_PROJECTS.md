# Using BrainOS In Projects

**Document Status:** Active Guide  
**Last Updated:** 2026-06-27

This guide explains how other projects should use BrainOS as a central governance reference.

## Purpose

BrainOS provides the central rules and standards for AI engineering work. Child projects read BrainOS rules, then create their own project-local governance files.

BrainOS is the source of truth for:

- Governance.
- Documentation.
- Architecture standards.
- Agent registry structure.
- Workflow documentation.
- Knowledge preservation.
- Engineering behavior.

## Canonical Source

Use the raw source URL when asking AI tools to read BrainOS rules:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

Prefer the raw URL over the GitHub `blob` URL because AI tools and web fetchers can read raw markdown more reliably.

## Core Rule

BrainOS is read-only for child projects.

Child projects and AI agents must not:

- Clone the BrainOS repository.
- Modify the BrainOS repository.
- Commit to the BrainOS repository.
- Push to the BrainOS repository.
- Edit the canonical `GLOBAL_RULES.md`.
- Create pull requests to BrainOS.
- Change files outside the current project directory.

## Project-Local Governance

Each child project should create its own local governance folder:

```text
ProjectName/
└── BRAINOS/
    ├── BRAINOS_ADOPTION.md
    ├── PROJECT_CHARTER.md
    ├── SYSTEM_ARCHITECTURE.md
    ├── AGENT_REGISTRY.md
    ├── API_CATALOG.md
    ├── DEPENDENCIES.md
    ├── DEPLOYMENT.md
    ├── DOCS/
    ├── KNOWLEDGE_BASE/
    ├── AGENTS/
    ├── WORKFLOWS/
    ├── MODULES/
    └── TEMPLATES/
```

## Recommended Prompt

Use this prompt when applying BrainOS to another project:

```text
Use BrainOS governance for this project.

Read BrainOS Global Rules from this canonical raw source:

https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md

IMPORTANT:
BrainOS is READ-ONLY for this task.

Do NOT:
- clone the BrainOS repository
- modify the BrainOS repository
- commit to the BrainOS repository
- push to the BrainOS repository
- edit GLOBAL_RULES.md
- create pull requests to BrainOS
- change any file outside this current project

Treat BrainOS only as an external governance reference.

Work only inside this current project directory.

If BrainOS governance files are missing in this current project, create them under:

BRAINOS/

Create or update only project-local documentation:
- BRAINOS/BRAINOS_ADOPTION.md
- BRAINOS/PROJECT_CHARTER.md
- BRAINOS/SYSTEM_ARCHITECTURE.md
- BRAINOS/AGENT_REGISTRY.md
- BRAINOS/API_CATALOG.md
- BRAINOS/DEPENDENCIES.md
- BRAINOS/DEPLOYMENT.md
- BRAINOS/DOCS/
- BRAINOS/KNOWLEDGE_BASE/
- BRAINOS/AGENTS/
- BRAINOS/WORKFLOWS/
- BRAINOS/MODULES/
- BRAINOS/TEMPLATES/

Do not overwrite existing project files.
Do not delete existing files.
Do not rename existing files.
Do not modify application code.
Do not create business logic, databases, APIs, Docker containers, infrastructure, or integrations unless explicitly requested later.

If code changes are requested later, follow BrainOS engineering rules:
- read existing project instructions first
- follow existing architecture
- make the smallest verified change
- patch before refactor
- refactor before rewrite
- verify after meaningful changes

Before making changes, show:
1. Whether the BrainOS raw source was readable
2. Files you plan to create or update inside this project only
3. Confirmation that BrainOS central repository will not be modified

After making changes, show:
1. Directory tree
2. Files created or updated
3. Confirmation that no files outside this project were changed
4. Confirmation that BrainOS central repository was not modified
```

## Minimal Prompt

Use this shorter version for small projects:

```text
Use BrainOS governance for this project.

Read BrainOS Global Rules from:

https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md

BrainOS is READ-ONLY.
Work only inside this current project.
Create project-local governance files under BRAINOS/.
Do not modify BrainOS central repository.
Do not modify application code unless explicitly requested.

Before making changes, show the files you plan to create or update.
```

## Expected Confirmation

Before making changes, the AI agent should confirm:

- The BrainOS raw source is readable.
- BrainOS central repository will not be modified.
- All changes will stay inside the current project.
- Project-local governance will be created under `BRAINOS/`.

## Future BrainOS Updates

BrainOS central rules are maintained in this repository. Changes to BrainOS itself should happen through a protected `main` branch and pull request workflow.

Child projects should continue referencing the canonical raw URL unless a future versioning policy introduces stable release tags.
