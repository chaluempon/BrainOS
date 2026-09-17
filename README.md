# BrainOS

Global Rules and governance foundation for BrainOS.

BrainOS is the central AI Engineering Operating System for governance, documentation, standards, agent registry, workflow structure, and knowledge preservation across AI projects.

## Quick Find

- [Current Global Rules Release](#current-global-rules-release)
- [Canonical And Published Locations](#canonical-and-published-locations)
- [Global Rules Update Workflow](#global-rules-update-workflow)
- [Infographic And PDF Publication](#infographic-and-pdf-publication)
- [Project Resumption Check](#project-resumption-check)
- [Rollback And Restore Points](#rollback-and-restore-points)
- [How Child Projects Use BrainOS](#how-child-projects-use-brainos)
- [Documentation](#documentation)

## Repository Role

This repository is the BrainOS foundation only. It is used to maintain central rules, governance documents, templates, registries, standards, and knowledge records.

Do not add runtime application code, business logic, databases, API services, Docker containers, secrets, or production infrastructure to this repository.

If BrainOS needs a runtime platform, create and maintain it as a separate project such as `BrainOS_Platform`. The platform may publish or serve rules from this repository, but this repository remains the source of truth for governance.

## Canonical Global Rules

### Current Global Rules Release

| Field | Current value |
| --- | --- |
| Approved local version | `2.5.0` |
| Supersedes | `2.4.0` (uncommitted local release) |
| Effective date | `2026-09-17` |
| Git publication | v2.5.0 merged to `main` through [PR #9](https://github.com/chaluempon/BrainOS/pull/9); release merge commit `98332feb5b854e44fc90fb63a33e2a92bd89a535` |
| Canonical file | [`GLOBAL_RULES.md`](GLOBAL_RULES.md) |

The version metadata inside `GLOBAL_RULES.md` is authoritative. If this table and the canonical file ever differ, use the canonical file and update this README and all published copies in the same controlled change.

## Current continuation checkpoint — 2026-09-17 09:27:46 +0700

- Project: `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS`; publication branch `docs/global-rules-v2.5.0-final-state`; release source is GitHub `main` merge commit `98332feb5b854e44fc90fb63a33e2a92bd89a535`.
- Working release: Global Rules v2.5.0, effective 2026-09-17, superseding the uncommitted local v2.4.0. Canonical SHA-256: `7535d716eb54056cf77cffdfc6ef99835cc35b1843189542c6d0aa579c71f76e`.
- The release files are committed. Unrelated untracked `.worktrees/`, `outputs/`, and `work/` content predates this final-state update and remains intentionally untouched; never reset or clean it.
- v2.5.0 adds `GLOBAL_RULES.md` Section 1.9: automatically update one current project checkpoint and durable task list after state-changing work; resumed agents read the latest checkpoint/task list first, verify bounded freshness, and avoid full rereads when the checkpoint remains valid.
- Independent closure review: `PASS`, 0 mandatory blockers, reviewed canonical SHA-256 `7535d716...` and release-diff SHA-256 `44f21c09...`.
- Reader-facing Markdown is byte-identical to canonical. Infographic is 1600 × 2600; detailed PDF is 10 pages. HTML parses, PDF text markers/bounds pass, and visual QA passed after removing one orphan footer page.
- Restore point: `/Users/dojo/.hermes/restore-points/BrainOS/20260917T090651+0700-before-v2.5.0`; exact v2.4.0 file SHA-256 `134b14a...`; verified full Git bundle SHA-256 `badc8b21...`.
- Owner explicitly authorized Git publication on 2026-09-17. PR #9 is merged and GitHub `main` read-back passed with canonical SHA-256 `7535d716...`. This grants no Production, credential, permission, destructive-action, or unrelated-publication authority. Existing child projects are not rewritten automatically.

### Durable task list

- `completed` `gr-250-restore`: Preserve and verify the exact v2.4.0 Markdown, reader package, and full Git bundle.
- `completed` `gr-250-rule`: Add Section 1.9 and v2.5.0 metadata to canonical Global Rules.
- `completed` `gr-250-review`: Independent read-only closure review passed with no mandatory blockers.
- `completed` `gr-250-publish-md`: Copy canonical Markdown to the OneDrive reader location and verify byte identity.
- `completed` `gr-250-reader-package`: Update HTML sources, regenerate stable PNG/PDF, create v2.5.0 previews, and pass visual QA.
- `completed` `gr-250-git-publication`: [PR #9](https://github.com/chaluempon/BrainOS/pull/9) merged; GitHub `main` version, Section 1.9, merge state, and canonical hash were read back successfully.
- No project task is pending. First next action: wait for a new owner request; do not modify child projects automatically.

Use this raw URL when another project needs to read BrainOS rules:

```text
https://raw.githubusercontent.com/chaluempon/BrainOS/main/GLOBAL_RULES.md
```

## Canonical And Published Locations

### Canonical source

```text
/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS/GLOBAL_RULES.md
```

GitHub `main` is the committed canonical history. Changes must follow repository change control and branch protection.

### OneDrive published copy

```text
/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS Rules/GLOBAL_RULES.md
```

This is the approved view-only copy for internal readers. After publication, compare it with the canonical source by byte or SHA-256 before reporting that it is current.

### Human-readable publication folder

```text
/Users/dojo/Documents/เอกสาร BrainOS
```

Every Global Rules update must also update the editable HTML sources and regenerate the current Infographic and PDF in this folder. Keep the stable filenames so internal users have one obvious current set.

## Global Rules Update Workflow

Follow these stages in order so each location represents the same approved release.

### Before editing

1. Confirm the active project, branch, working tree, local `HEAD`, and `origin/main`.
2. Read the current `GLOBAL_RULES.md` and relevant governance documents.
3. Create and independently verify a restore point for the current Global Rules and publication artifacts.
4. Record the old version, checksum, and Git baseline.

### Edit and verify

1. Update the canonical `GLOBAL_RULES.md` first.
2. Increase the rule-set version and record `Supersedes`, review date, effective date, and rollback source.
3. Validate Markdown structure, whitespace, required sections, and internal consistency.
4. Perform an independent review for material governance changes.
5. Do not claim completion until the acceptance criteria and rollback checks pass.

### Publish

Owner approval to edit a release is not permission to commit or push it. Perform the Git steps only with explicit publication authorization; until then, label the approved local release and the last verified Git release separately.

1. Commit with the version in the subject, for example: `docs(governance): release Global Rules v2.5.0`.
2. Push a dedicated branch, open a pull request, and merge through branch protection.
3. Verify the exact file and version on GitHub `main`, then synchronize local `main`.
4. Replace the OneDrive published copy from the canonical source and verify matching checksums.
5. Update and regenerate the Infographic and detailed PDF in `/Users/dojo/Documents/เอกสาร BrainOS`.
6. Verify the rendered image and every PDF page visually before reporting `DONE`.

## Infographic And PDF Publication

Maintain these stable deliverables:

```text
/Users/dojo/Documents/เอกสาร BrainOS/BrainOS_GLOBAL_RULES_Infographic.html
/Users/dojo/Documents/เอกสาร BrainOS/BrainOS_GLOBAL_RULES_Infographic.png
/Users/dojo/Documents/เอกสาร BrainOS/BrainOS_GLOBAL_RULES_คู่มือฉบับละเอียด.html
/Users/dojo/Documents/เอกสาร BrainOS/BrainOS_GLOBAL_RULES_คู่มือฉบับละเอียด.pdf
```

### Publication rules

- Treat HTML files as the editable sources and regenerate PNG/PDF from them.
- Preserve exact approved terminology across HTML, PNG, and PDF.
- Show the active Global Rules version and effective date.
- Include only current, approved content; remove superseded claims and obsolete estimates.
- Check Thai text shaping, clipping, overlap, tables, page breaks, and image dimensions.
- Preserve a verified artifact restore point before overwriting the current deliverables.

## Project Resumption Check

Global Rules v2.1.0 adds a delta-based resumption check.

Global Rules v2.5.0 adds a durable continuation rule: after project work changes state, update one designated current checkpoint and task list before the final response. A resumed agent reads that latest checkpoint and task list first, verifies bounded freshness, and does not reload the whole README, historical checkpoints, repository, or knowledge base when the current state remains valid.

### After 7 or more days without verified project activity

Check the Global Rules version, project rules, Git branch and working tree, current objective, acceptance status, relevant configuration, and risk tier before modifying the project.

### After 30 or more days, or when the previous state is unknown

Also revalidate the relevant architecture, runtime or deployment path, integrations, dependencies, security assumptions, and rollback path.

### Immediate refresh triggers

Run the check without waiting seven days when rules, branch, requirements, environment, dependencies, integrations, agent, tool, model provider, security posture, ownership, or runtime state changed, or after a handoff, incident, failed deployment, restore, or rollback.

The time threshold triggers validation only. It does not authorize automatic rule edits, full knowledge reloads, documentation rewrites, dependency upgrades, production access, or repeated questions.

## Rollback And Restore Points

### Immediate rollback from v2.5.0 to local v2.4.0

- Verified snapshot: `/Users/dojo/.hermes/restore-points/BrainOS/20260917T090651+0700-before-v2.5.0`.
- Restore `repository/GLOBAL_RULES.md` with SHA-256 `134b14a98819a381df470e51fb3038610ba9177fb82cf4e6fcb3040dbb8f052b`.
- Verified full Git bundle: `BrainOS-full.bundle`, SHA-256 `badc8b214c31ca85c336ce15869f39a4969757da8198fad4f546106c73e9cc96`.
- v2.4.0 was not committed. The Git bundle baseline is v2.2.0 and must not be substituted for this exact file rollback.
- Preserve newer work before restoring selected files. Never reset or clean the repository to restore one policy file.

### v2.5.0 durable continuation checkpoint

See `GLOBAL_RULES.md` Section 1.9. Every state-changing project task must keep one current README checkpoint (or a project-designated equivalent linked from README) and a durable task list. The record must distinguish verified source, historical runtime evidence, and live state; preserve owner gates and secrets; and name the first pending action. Resumed agents load the latest checkpoint and task list first, verify only the freshness needed for that action, and expand discovery only when the checkpoint is stale, contradictory, or incomplete.

The release report and verification record are in `outputs/global-rules-v2.5.0/`. Independent closure review passed with no mandatory blockers. The reviewed local diff remains preserved with the restore/review evidence but is not published as a tracked unified-diff artifact. This policy update does not prove automatic enforcement by every agent and grants no Production, credential, or permission authority.

### Historical rollback from v2.4.0 to local v2.3.0

- Verified snapshot: `/Users/dojo/.hermes/restore-points/BrainOS/20260915T161903+0700-before-v2.4.0`.
- Restore `repository/GLOBAL_RULES.md` with SHA-256 `427ab569144f63431839d6e638dd391d3b7e92334426dbd881baa1d441134803`.
- v2.3.0 was not committed. The Git bundle baseline is v2.2.0 and must not be substituted for this exact file rollback.
- Preserve newer work before restoring selected files or reader-package archive members. Historical rollback points below are not the current default.

### v2.4.0 speed and continuity evidence

See `GLOBAL_RULES.md` Sections 1.4, 1.5, 1.8, 5, 13, and 18. Principles cover readiness, direct tools, single-writer coordination, bounded review, continuity under user steering, observed progress, artifact/readback evidence, unchanged safety gates, operational details in skills, and measured elapsed time.

The offline example report and verification results are in `outputs/global-rules-v2.4.0/`. The example verifies local files and subprocess supervision only; it is not proof of LLM compliance, production enforcement, or improved speed. No production, system permissions, or child-project copies were changed. `AGENTS.md` was left unchanged in that revision after its separate tool approval expired.

### Historical rollback from v2.3.0 to v2.2.0

- Previous rule file: `GLOBAL_RULES.md` at Git commit `d0564e3d3ed13fb71ad67a1e41a4473dd669ef79`.
- Verified snapshot: `/Users/dojo/.hermes/restore-points/BrainOS/20260914T215557+0700-before-v2.3.0`.
- The snapshot preserves the pre-edit tracked files (including the uncommitted README), working/staged patches, Git bundle, reader-package archive, and previous published Markdown. Existing untracked work is outside the change scope and remains untouched.
- Restore only named files after preserving newer work. Do not use a repository-wide reset or treat older baselines below as the immediate rollback target.

### v2.3.0 compatibility and maintenance scope

This release clarifies evidence-first questions, continued in-scope implementation, contextual supporting-document loading, side-effect-aware verification, and concise model-neutral skill guidance. Security invariants, restore points, knowledge roles, review caps, and commit/push approval remain unchanged. Project Starter changes apply to future adoption; no existing child projects or Hermes profile skills were automatically rewritten.

### Global Rules v2.0.0 baseline

```text
/Users/dojo/.hermes/restore-points/BrainOS/20260826T081728+0700-global-rules-v2.0.0
```

This restore point contains the preserved v2.0.0 Markdown file, a verified full Git bundle, and restore instructions.

### Publication artifacts before v2.1.0

```text
/Users/dojo/.hermes/restore-points/BrainOS-deliverables/20260826T142701+0700-before-v2.1.0
```

Before rollback, preserve newer working-tree and publication changes. Restore only the required scope, re-run verification, and do not commit or push the rollback without explicit owner authorization.

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
