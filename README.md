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
| Approved local version | `2.6.0` |
| Supersedes | `2.5.0` |
| Effective date | `2026-09-20` |
| Git publication | v2.6.0 merged to `main` through [PR #11](https://github.com/chaluempon/BrainOS/pull/11); release merge commit `67404f5ae58bcbda963f648814e450de1101a403` |
| Canonical file | [`GLOBAL_RULES.md`](GLOBAL_RULES.md) |

The version metadata inside `GLOBAL_RULES.md` is authoritative. If this table and the canonical file ever differ, use the canonical file and update this README and all published copies in the same controlled change.

## Current continuation checkpoint — 2026-09-20 01:44:06 +0700

- Project: `/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS`; publication-record branch `docs/global-rules-v2.6.0-final-state`; release source is GitHub `main` merge commit `67404f5ae58bcbda963f648814e450de1101a403`.
- Published release: Global Rules v2.6.0, effective 2026-09-20, superseding v2.5.0. Canonical SHA-256: `de2d12391da8dd6b046712e3ec509e4d5783493ca26105280061f21bdaac53a8`.
- The release files are committed. Existing `.worktrees/`, unrelated `outputs/`, and `work/` content remains intentionally untouched; never reset or clean it.
- Verified restore point: `/Users/dojo/.hermes/restore-points/BrainOS/20260920T012832+0700-before-v2.6.0`; exact v2.5.0 SHA-256 `7535d716...`; full Git bundle and reader-package archive passed verification.
- The corrected rule designates authorized non-production build/CI/staging targets, allows bounded local checks, forbids treating Production as the default, preserves commit/push owner gates, distinguishes a remote source checkpoint from a full restore point, and resolves conflicts through Section 1.3.
- Independent closure review on canonical SHA-256 `de2d1239...`: `PASS`, 0 mandatory blockers. Canonical, OneDrive, and Documents Markdown are byte-identical; Infographic is 1600 × 2600 and the detailed PDF is 11 pages; geometry, text bounds, and visual QA of every page passed.
- Owner authorized Git publication on 2026-09-20. [PR #11](https://github.com/chaluempon/BrainOS/pull/11) is merged and GitHub `main` read-back passed for version, rule markers, and canonical hash. This grants no Production, credential, permission, destructive-action, or unrelated-publication authority.
- No release task is pending. First next action: wait for a new owner request; do not modify child projects automatically.

### Durable task list

- `completed` `gr-260-restore`: Preserve and verify v2.5.0, Git history, the pre-existing v2.6.0 reader candidate, and the reader package.
- `completed` `gr-260-rule`: Correct the canonical v2.6.0 rule and metadata without weakening precedence or owner gates.
- `completed` `gr-260-review`: Structure, compatibility, diff scope, and independent closure review passed against canonical SHA-256 `de2d1239...`.
- `completed` `gr-260-reader`: OneDrive and Documents Markdown match canonical; regenerated HTML, PNG, PDF, and previews passed geometry, text-bound, and visual QA.
- `completed` `gr-260-git`: [PR #11](https://github.com/chaluempon/BrainOS/pull/11) merged; GitHub `main` version, rule markers, and canonical hash were read back successfully.
- `completed` `gr-260-record`: Publication state and evidence recorded; all required release surfaces verified.

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

1. Commit with the version in the subject, for example: `docs(governance): release Global Rules v2.6.0`.
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

Global Rules v2.6.0 adds execution-location and remote-source-checkpoint controls. Use the project-designated non-production build, CI, staging, or runtime-equivalent target for authoritative verification when applicable; do not treat Production as the default. A local check is not target-runtime evidence, and a pushed commit preserves tracked source only. Commit, push, deployment, credentials, and elevated access still require their existing authorization.

### After 7 or more days without verified project activity

Check the Global Rules version, project rules, Git branch and working tree, current objective, acceptance status, relevant configuration, and risk tier before modifying the project.

### After 30 or more days, or when the previous state is unknown

Also revalidate the relevant architecture, runtime or deployment path, integrations, dependencies, security assumptions, and rollback path.

### Immediate refresh triggers

Run the check without waiting seven days when rules, branch, requirements, environment, dependencies, integrations, agent, tool, model provider, security posture, ownership, or runtime state changed, or after a handoff, incident, failed deployment, restore, or rollback.

The time threshold triggers validation only. It does not authorize automatic rule edits, full knowledge reloads, documentation rewrites, dependency upgrades, production access, or repeated questions.

## Rollback And Restore Points

### Immediate rollback from v2.6.0 to v2.5.0

- Verified restore point: `/Users/dojo/.hermes/restore-points/BrainOS/20260920T012832+0700-before-v2.6.0`.
- Restore `repository/GLOBAL_RULES.md` with SHA-256 `7535d716eb54056cf77cffdfc6ef99835cc35b1843189542c6d0aa579c71f76e`.
- Verified full Git bundle: `BrainOS-full.bundle`, SHA-256 `84524428c8294980f4f9eacc4cabaeb26e018b1a03d4926dfccae5ad67a3a3cf`.
- Verified reader-package archive: `reader-package-before-v2.6.0.zip`, SHA-256 `241b367e0ef995b7caca05caaf9edb74d23a8b81ff063d29d592452b86a68ea9`.
- The restore point also preserves the pre-existing v2.6.0 reader candidate that had been written outside the canonical repository; that candidate is evidence, not the v2.5.0 rollback target.
- Preserve newer work and restore only authorized files. Never reset or clean the repository to roll back this release.

### v2.6.0 execution location and remote source checkpoints

See `GLOBAL_RULES.md` Section 10, subsection `Execution Location And Remote Checkpoint Rules`. The authoritative verification target must be project-designated and non-production by default. Bounded local checks remain allowed, but target-runtime claims require the applicable target evidence. A pushed commit is a tracked-source checkpoint, not a full backup, and the rule does not grant commit, push, deployment, credential, Production, or elevated-access authority.

### Historical rollback from v2.5.0 to local v2.4.0

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
