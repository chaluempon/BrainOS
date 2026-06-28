# BrainOS Project Starter

Copy the contents of this folder into any project root to adopt BrainOS by central reference.

The copied project files do not duplicate global rules. They point agents back to the canonical BrainOS `GLOBAL_RULES.md`, so global rule updates are made once in BrainOS and reused by every project.

From the BrainOS repository:

```bash
cp -R TEMPLATES/BRAINOS_PROJECT_STARTER/. /path/to/target-project/
```

After copying, update:

- `BRAINOS/BRAINOS_ADOPTION.md`
- `BRAINOS/PROJECT_RULES.md`
- `BRAINOS/SECURITY_EXPOSURE_CHECKLIST.md`

At minimum, replace:

- `Project Owner`
- `YYYY-MM-DD`
- Any project-specific security requirements that do not apply.

Do not copy the contents of BrainOS `GLOBAL_RULES.md` into the target project. Keep global rules centralized.

Expected target structure:

```text
target-project/
  AGENTS.md
  BRAINOS/
    BRAINOS_ADOPTION.md
    PROJECT_RULES.md
    SECURITY_EXPOSURE_CHECKLIST.md
```

Agents should read `AGENTS.md` first, then the files under `BRAINOS/`.

Required central rule file:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

If a project needs offline operation, add BrainOS as a Git submodule or local mirror and document it as a fallback. Keep the GitHub raw URL as the canonical source.
