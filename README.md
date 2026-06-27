# BrainOS

Global Rules and governance foundation for BrainOS.

BrainOS is the central AI Engineering Operating System for governance, documentation, standards, agent registry, workflow structure, and knowledge preservation across AI projects.

## Canonical Global Rules

Use this raw URL when another project needs to read BrainOS rules:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

## How Child Projects Use BrainOS

Child projects must treat this BrainOS repository as read-only. They should not clone, edit, commit, push, or create pull requests to BrainOS unless the user explicitly states that the task is to maintain BrainOS itself.

For project-local governance, create files inside the child project's own `BRAINOS/` directory.

Recommended prompt:

```text
Use BrainOS governance for this project.

Read BrainOS Global Rules from this canonical raw source:

https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md

BrainOS is READ-ONLY for this task.
Work only inside this current project directory.
Create project-local governance files under BRAINOS/.
Do not modify BrainOS central repository.
Do not modify application code unless explicitly requested.

Before making changes, show the files you plan to create or update.
```

## Documentation

- [Using BrainOS In Projects](DOCS/USING_BRAINOS_IN_PROJECTS.md)
- [Global Rules](GLOBAL_RULES.md)
- [Project Charter](PROJECT_CHARTER.md)
- [System Architecture](SYSTEM_ARCHITECTURE.md)
