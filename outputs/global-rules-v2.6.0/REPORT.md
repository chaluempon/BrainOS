# Global Rules v2.6.0 Release Report

## Summary

BrainOS Global Rules v2.6.0 adds `Execution Location And Remote Checkpoint Rules` under Section 10. The release establishes project-designated non-production verification targets while preserving all existing Production, deployment, credential, elevated-access, commit, and push gates.

This report covers the corrected canonical release. A pre-existing reader candidate was not adopted as-is because it treated a target host too broadly, implied automatic commit/push authority, called a pushed commit a complete restore point, reversed canonical and reader roles, and lacked a recoverable v2.5.0 snapshot.

## Release scope

- Version: `2.6.0`
- Supersedes: `2.5.0`
- Effective date: `2026-09-20`
- Canonical SHA-256: `de2d12391da8dd6b046712e3ec509e4d5783493ca26105280061f21bdaac53a8`
- Baseline commit: `f8433b6cfd5da4d2a95629533ac486a4c5b9c202`
- Release branch: `docs/global-rules-v2.6.0`

Excluded: Production actions, deployments, credential or permission changes, destructive actions, automatic child-project rewrites, and unrelated working-tree content.

## Policy result

1. The target must be an authorized non-production build, test, CI, staging, or runtime-equivalent environment designated by project instructions.
2. Authoritative target verification is required for target-runtime claims; bounded local documentation, syntax, schema, and editor checks remain allowed.
3. Production is not a default verification target, and deployment retains its exact owner gate and operational controls.
4. Checkpoints occur at meaningful usable states rather than every micro-step.
5. Commit and push occur only when already authorized and after scope review; the rule grants no new authority.
6. A pushed commit is a remote checkpoint for tracked source only, not a backup for databases, runtime state, generated deliverables, external systems, or untracked files.
7. Project-specific instructions may require stricter or safer execution paths under the existing Rule Precedence.

## Restore evidence

Restore point identifier: `20260920T012832+0700-before-v2.6.0`

- Exact v2.5.0 Markdown SHA-256: `7535d716eb54056cf77cffdfc6ef99835cc35b1843189542c6d0aa579c71f76e`
- Verified full Git bundle SHA-256: `84524428c8294980f4f9eacc4cabaeb26e018b1a03d4926dfccae5ad67a3a3cf`
- Verified reader-package archive SHA-256: `241b367e0ef995b7caca05caaf9edb74d23a8b81ff063d29d592452b86a68ea9`
- The v2.5.0 file was byte-compared with `HEAD:GLOBAL_RULES.md`; the bundle and archive verification passed.

## Verification

- Markdown structure and top-level Sections 1–20: `PASS`
- `git diff --check`: `PASS`
- Added-line secret-pattern scan: `PASS`
- Sections 1.3, 1.4, 9, and 16 remained byte-identical to v2.5.0: `PASS`
- Independent read-only closure review on the exact canonical hash: `PASS`, 0 mandatory blockers
- Canonical, OneDrive Markdown, and Documents reader Markdown byte comparison: `PASS`
- Infographic geometry and overflow checks: `PASS`; final size `1600 × 2600`
- PDF text markers, text-block bounds, and non-empty-page checks: `PASS`; final size `11 pages`
- Visual QA of the infographic and all 11 PDF pages: `PASS`
- Unnecessary internal project and host identifiers removed from reader artifacts: `PASS`

## Reader artifact hashes

| Artifact | SHA-256 |
| --- | --- |
| Infographic HTML | `d0f5cb1a7b7c0ac16a5c3d765f378ed0a759b5bc517d6f5d7781d5aa8a4918a2` |
| Infographic PNG | `a41f603e376bea8f9189524ae3e35d83604854f72c203d5887dbac4e6c84fc8e` |
| Detailed-guide HTML | `b7181eebe29a02b12853759f4367cf44f85d19707f04c145da58999dd046ca97` |
| Detailed-guide PDF | `b2d9a4bcdb4b7f69e5dda429de815f53dc7bb4ae2abcd281e4f2442ecf838499` |

## Git publication

Pending at the time of this report revision. The release must be committed on the dedicated branch, pushed without unrelated untracked files, merged through the repository workflow, and read back from GitHub `main` before publication is reported complete.
