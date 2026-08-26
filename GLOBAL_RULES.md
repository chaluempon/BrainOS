# BrainOS Global AI Engineering Rules

**Document Status:** Active Standard<br>
**Authority:** Single Source Of Truth<br>
**Owner:** BrainOS Owner<br>
**Rule Set Version:** 2.1.0<br>
**Supersedes:** 2.0.0<br>
**Rollback Source:** BrainOS restore point `20260826T081728+0700-global-rules-v2.0.0`; Git baseline `85531c6556f6dc98c9806efdeeea402f228f00b0`<br>
**Reviewed By:** BrainOS Owner<br>
**Review Date:** 2026-08-26<br>
**Effective Date:** 2026-08-26<br>
**Next Review:** Within 90 days or after a material governance incident or change<br>
**Last Updated:** 2026-08-26

BrainOS Global AI Engineering Rules define the mandatory operating standard for all AI systems, AI projects, AI agents, documentation, workflows, governance artifacts, and engineering work managed under BrainOS.

These rules apply to AI Agents, Codex, Claude Code, Cursor, Windsurf, OpenHands, Roo, Cline, and all future BrainOS agents or engineering tools.

## 1. Golden Rule

The best solution is the smallest correct solution that can be verified.

Priority:

1. Delete.
2. Patch.
3. Refactor.
4. Rewrite.

Never add complexity without evidence.

### 1.1 Work Size And Risk Tiers

Before acting, classify the task by impact and risk. Impact always takes priority over the apparent size of a diff.

When the tier is uncertain or disputed, apply the higher tier. Only the accountable owner may confirm a tier lower than the agent's evidence-based assessment.

For these rules:

- A **material change** changes purpose or scope, ownership, architecture, dependencies, security or authorization boundaries, data handling, external interfaces, deployment, or operational behavior.
- A **transient assistant** completes a bounded task within the current session, has no persistent state or automated trigger, and receives no new tool access, data access, or decision authority.

#### Low-Risk And Reversible

Examples include read-only inspection, typo fixes, documentation updates, local analysis, and small changes that can be safely reversed.

Rules:

- Use only the governance artifacts and verification needed for the requested outcome.
- Do not create a new charter, architecture document, registry, risk register, or approval gate when the task does not materially change the governed system.
- Use a safe, reversible default when the repository and existing instructions provide enough evidence.
- Verify the affected scope without expanding the task.

#### Standard

Examples include features, multi-file bug fixes, APIs, automations, workflow changes, and new dependencies.

Rules:

- Define scope and acceptance criteria.
- Review relevant architecture, dependencies, risks, and project instructions.
- Run the checks required to verify the changed behavior.
- Update durable documentation when the change is material.

#### High-Risk

Examples include production changes, public exposure, sensitive or regulated data, authentication or authorization boundaries, secrets, database migrations, destructive actions, and changes that are difficult to reverse.

Rules:

- Require an authorized owner and explicit approval for the exact action and environment.
- Preserve a verified restore point or backup before change.
- Define rollback, abort criteria, and post-change verification.
- Apply the relevant security, privacy, deployment, and operational controls.
- Never downgrade a task merely because the code or configuration change is small.

Security, privacy, authorization, secret handling, repository boundaries, and controls over destructive or irreversible production actions are invariant. Lower-priority rules, project preferences, efficiency goals, and task-local instructions must not waive them.

### 1.2 Question And Assumption Protocol

Before asking the user, an agent must:

1. Re-read the current request and answers already provided.
2. Inspect the authorized repository, documentation, tools, and source of truth when they can answer the question safely.
3. Avoid asking for information that is already present or retrievable.
4. Use a clearly stated safe and reversible assumption for low-risk work when the assumption does not materially change the outcome.
5. Combine independent blocking questions into one concise question set.

An agent must ask before proceeding when the missing decision concerns credentials, login, elevated permissions, payment, production, sensitive data, public exposure, destructive or irreversible action, insufficient authority, or alternatives with materially different outcomes or risks.

Do not repeat a question, including a semantically equivalent rewording, unless new evidence or a changed condition makes the previous answer insufficient. This rule continues across summaries, context compaction, handoffs, and resumed sessions.

Record every answered decision and stated assumption in the acceptance contract or durable task state before continuing. Enforce the no-repeat rule against that record rather than conversation memory alone. Low-risk work does not require a new file when the current session's task state remains sufficient.

When escalating, report only the blocker, redacted evidence already checked, the risk of proceeding, and the exact decision required. Never echo secrets, credentials, private keys, regulated data, or unnecessary personal information.

### 1.3 Rule Precedence

When instructions conflict, apply this order:

1. Safety, security, privacy, and authorization.
2. Repository protection.
3. Change control and approved operational controls.
4. Project-specific rules and acceptance criteria.
5. Global governance and engineering rules.
6. Efficiency, presentation, and output style.

A specific rule may override a general rule only when it does not violate a higher-priority layer.

Project-specific rules may tighten global rules or govern matters the global rules leave open. They must not waive human accountability, traceability, required agent registration, approval authority, or any invariant control defined by these Global Rules.

When rules at the same layer conflict, prefer the option that is safer, has less impact, is easier to reverse, and can be verified more directly. If a high-impact conflict remains unresolved, stop and request the minimum necessary decision.

Project-native tooling determines the supported command or workflow. Use the CLI as the execution channel when appropriate; CLI priority does not authorize bypassing project-native tooling.

### 1.4 Acceptance Contract And Final Status

Before implementation, establish a task-appropriate acceptance contract from the request and available project evidence. It must identify:

- The required outcome.
- Scope and explicit exclusions.
- Acceptance criteria.
- Required checks or evidence.
- Material risks, prohibited actions, and required approvals.

Use detail proportional to the task tier. A low-risk task may use a short implicit contract derived from the request; a high-risk task requires an explicit contract.

Every final report must use one of these states:

- `DONE`: The requested outcome and acceptance criteria are verified.
- `PARTIAL`: A defined portion is verified, and the incomplete portion is identified.
- `BLOCKED`: Work cannot safely continue because of a concrete blocker.
- `ESCALATED`: A new approval, credential, authority, or material decision is required.

Do not report `DONE` when verification has not occurred, a named requirement is incomplete, the deliverable is only a plan or stub, or the conclusion depends on unsupported assumptions.

### 1.5 Anti-Loop And Evidence-Based Escalation

Do not repeat the same diagnosis, patch, command, question, or verification without new evidence or a stated reason that changes the expected result.

After a failed verification:

1. Read the new error or evidence.
2. Re-evaluate the current root-cause hypothesis.
3. Identify what changed since the previous attempt.
4. Choose a materially different evidence-based next action.
5. Stop as `BLOCKED` or `ESCALATED` when progress requires unavailable authority, information, access, or a speculative change.

Do not use one fixed retry, loop, or token limit for all tasks. The stop threshold must be proportional to risk, reversibility, evidence gained, and the cost of another attempt. High-risk work must not become faster by skipping required verification.

### 1.6 Approval Authority And Rule Versioning

An approval must identify:

- The authorized approver.
- The exact action and scope approved.
- The target environment.
- Any time limit or expiry.
- Required rollback and post-action verification.

Approval for one task, environment, or action does not imply approval for another. Agents must not approve production actions on behalf of the accountable owner.

Each active Global Rules release must record an owner, rule-set version, review date, effective date, and next review trigger. Material rule changes require a verified restore point, compatibility review, and a documented rollback source before becoming effective.

If two requirements within the same precedence layer conflict, the BrainOS Owner or explicitly delegated reviewer is the tie-break authority. Until resolved, preserve the safer existing behavior.

### 1.7 Project Resumption And Rule Refresh

A project resumption check is required before modifying a project after seven or more calendar days without verified project activity. The seven-day threshold triggers validation; it does not authorize automatic rule changes, documentation rewrites, dependency upgrades, or broad repository review.

The check must compare the current state with the last verified project state:

1. Confirm the canonical Global Rules version or checksum and the version recorded by the project.
2. Read current project instructions and the adoption record, if present.
3. Inspect the active Git branch, working tree, and relevant changes since the last verified activity.
4. Reconfirm the current objective, acceptance criteria, completed work, and open blockers.
5. Inspect only dependencies, configuration, integrations, and runtime assumptions relevant to the resumed task.
6. Reassess the work-size and risk tier before acting.

If the canonical rules and relevant project state are unchanged, reuse the verified project state and continue without re-reading the complete rules or regenerating governance documents.

If the Global Rules version changed, read the release difference rather than the entire knowledge base, identify which changes apply to the project, and update the project adoption record only when the change materially affects project behavior or controls.

After thirty or more calendar days without verified project activity, or when the previous state is unknown, additionally revalidate the relevant architecture, deployment or runtime path, integrations, dependencies, security assumptions, and rollback path. Do not access production, credentials, or restricted data merely to complete this check; follow the approval and security rules when live verification is required.

Run the resumption check immediately, regardless of elapsed time, when any of these conditions is known or suspected:

- The Global Rules or project rules changed.
- The branch, source, requirement, environment, dependency, configuration, integration, agent, tool, model provider, security posture, or runtime state changed.
- Another person or agent modified or handed off the work.
- A security incident, failed deployment, restore, rollback, or unexplained state drift occurred.

Record a compact resumption state in the acceptance contract or durable task state: rule version, branch or source reference, material changes found, current risk tier, acceptance status, and the next verified action. Do not repeat decisions already preserved in that state unless new evidence changes them.

Agents must not:

- Modify the canonical Global Rules merely because time elapsed.
- Overwrite project-local governance or adoption files without comparing versions and impact.
- Re-read the entire knowledge base when the version and relevant state are unchanged.
- Trust an old session summary without checking the current repository and authorized system state.
- Resume from an old branch, environment, or runtime assumption without validation.

## 2. Core Governance Principles

1. **Governance first and proportional:** Every governed task must have enough ownership, scope, risk, and review evidence for its tier. Standard and high-risk projects require the full applicable governance set. Low-risk reversible work may proceed using existing project governance and a task-level acceptance contract when it does not materially change the governed system.
2. **Documentation is a system asset:** Documentation is not optional support material. It is part of the operating system and must be maintained with the same discipline as implementation artifacts.
3. **Human accountability:** AI agents may assist, propose, generate, summarize, and automate, but accountable ownership remains with named human or organizational owners.
4. **Traceability:** Important decisions, assumptions, dependencies, and changes must be traceable through approved BrainOS documents.
5. **Auditability:** Agent behavior, workflow design, data usage, and integration assumptions must be documented well enough to support review and audit.
6. **Least privilege:** Agents, tools, and workflows must use only the access required for their approved purpose.
7. **Reusability:** Standards, templates, modules, workflows, and lessons learned must be reusable across future projects.
8. **Maintainability:** Systems must be understandable by future maintainers without relying on undocumented memory or informal context.
9. **Security and privacy by design:** Sensitive data, credentials, proprietary information, and regulated data must be handled according to approved governance controls.
10. **Vendor neutrality:** BrainOS standards must remain portable across tools, models, vendors, and execution environments where practical.

## 3. Project Governance Rules

Every standard or high-risk AI project governed by BrainOS must maintain the applicable items below. Low-risk reversible tasks may rely on existing project records and must not create missing artifacts unless the task materially changes the governed system:

- A project charter.
- A system architecture document.
- A dependency inventory.
- An agent registry entry for every active or proposed agent.
- A workflow inventory for every managed workflow.
- A risk register or documented risk section.
- Success metrics and review criteria.
- Ownership and status metadata.

Projects must not rely on undocumented assumptions, hidden integrations, unmanaged prompts, or unregistered agents.

## 4. Agent Governance Rules

Every persistent, operational, or project-managed AI agent must be registered before use in a governed project. A transient assistant used for a bounded low-risk task may operate under the existing project tool policy and accountable owner when it does not gain new tools, data access, or decision authority. The registry must define:

- Agent name.
- Purpose.
- Owner.
- Inputs.
- Outputs.
- Dependencies.
- Tools.
- Status.
- Last updated date.

Agents must operate within their documented purpose. Any expansion of scope, tool access, data access, or decision authority requires registry review.

Agents must not:

- Use undocumented tools or integrations.
- Store secrets in prompts, source files, or documentation.
- Make irreversible production changes without approved human control.
- Produce decisions that cannot be reviewed or explained.
- Bypass BrainOS documentation standards.

## 5. Documentation Rules

All BrainOS documents must use professional markdown and include clear structure. Long-lived governance documents should include status, owner where applicable, and last updated date.

Documentation must be:

- Specific enough to guide implementation.
- Concise enough to remain maintainable.
- Updated when architecture, scope, dependencies, or operating assumptions change.
- Written for future maintainers, auditors, and project teams.

Feature documentation must include:

- Objective.
- Workflow.
- Dependencies.
- Configuration.
- Usage example.
- Limitations.

Feature documentation must not include changelog or version history. Git or the approved project history system tracks history.

## 6. Knowledge Preservation Rules

Important knowledge must be captured in BrainOS rather than remaining in chat history, personal notes, or temporary tool output.

Preserve:

- Architecture decisions.
- Design assumptions.
- Workflow rationale.
- Evaluation findings.
- Operational lessons learned.
- Known limitations.
- Future improvement candidates.

## 7. Workflow Governance Rules

Every managed workflow must document:

- Trigger.
- Inputs.
- Processing.
- Outputs.
- Failure handling.
- Monitoring.

Workflows must define ownership, expected behavior, review points, and failure response before operational use.

## 8. Data And Integration Rules

BrainOS must maintain clear inventories for data sources, APIs, MCP servers, external tools, model providers, and organizational systems used by governed projects.

No integration may be treated as approved unless it is documented with:

- Purpose.
- Owner.
- Data exchanged.
- Access requirements.
- Risk considerations.
- Current status.

## 9. Global Security Rules

Security is deny-by-default. Any service, API, model server, dashboard, database, queue, storage, tunnel, reverse proxy route, dev server, notebook, AI UI, CI/CD runner, storage bucket, webhook, or automation endpoint must be private unless explicitly approved.

Unknown public exposure is treated as a security incident.

Security review must include IPv4, IPv6, cloud firewall/security group, DNS records, reverse proxies, tunnels, router port forwarding, and container port publishing.

Every exposed service must have:

- Owner.
- Purpose.
- Environment: dev/staging/prod.
- Exposure level: local/private/public.
- Port/domain.
- Authentication method.
- Authorization scope.
- Allowed users or source IPs.
- TLS requirement.
- Firewall or network control.
- Logging location.
- Monitoring or alert rule.
- Rate limit, quota, timeout, or resource limit.
- Data sensitivity level.
- Secret handling requirement.
- Review date.
- Expiry date if temporary.

Public exposure is prohibited unless it has:

- Explicit approval.
- Authentication.
- Least-privilege authorization.
- TLS.
- Firewall, VPN, allowlist, or equivalent network control.
- Logging and monitoring.
- Rate limits or resource limits.
- Documented owner and review date.

Temporary access must always have an expiry date. Access without an owner, auth, logs, or review date must be removed.

All exceptions must be documented, time-limited, reviewed periodically, and removed when no longer needed.

User-provided URLs, file paths, uploads, webhooks, and AI tool actions must be validated and restricted from accessing internal services, private networks, metadata endpoints, secrets, or unauthorized files.

Secrets, tokens, credentials, customer data, internal URLs, and sensitive logs must not be committed, exposed, screenshotted, pasted into prompts, or shared publicly.

After any abuse or suspected exposure, close access first, preserve logs, review scope, rotate affected secrets, check usage/billing, document root cause, and add a prevention rule before reopening.

## 10. Engineering Execution Rules

These rules apply when a BrainOS-governed project involves code, configuration, automation, infrastructure, or implementation work. BrainOS itself remains a governance and documentation foundation unless explicitly approved otherwise.

### Refactor Rules

Before refactoring, always ask:

- What can be deleted?
- What can be deduped?
- What can be simplified?

Rules:

- Avoid premature abstraction.
- Apply YAGNI.
- Accept duplication when it is simpler and clearer.
- Do not add a new abstraction before a second real use case.
- Do not refactor unrelated code.
- Do not continue refactoring without evidence.

Mental checklist before editing:

1. What is broken?
2. What is the root cause?
3. What is the smallest fix?
4. What is the impact?
5. Why is this fix appropriate?

### Rewrite Rules

A rewrite requires justification.

Rewrite only when:

- Patching is riskier than replacing.
- The current design blocks the required change.
- Behavior is well understood.
- There is a clear migration or verification path.
- The rewrite is smaller or safer than continued patching.

Before rewriting, explain:

1. Why patching is not enough.
2. What will be deleted.
3. What behavior must stay the same.
4. What risk is introduced.
5. How the rewrite will be verified.

Default position:

- Patch first.
- Refactor second.
- Rewrite last.

### Existing Architecture Rules

When working in an existing project:

- Follow existing patterns.
- Match current style.
- Reuse the current stack.
- Read real code before making assumptions.
- Keep changes inside the existing architecture.

Do not introduce frameworks, queues, authentication systems, databases, ORMs, state managers, or infrastructure patterns unless explicitly requested or clearly justified by the task.

## 11. Quality Rules

### Performance

Optimize only with evidence.

Avoid:

- N+1 queries.
- `SELECT *`.
- Loading full tables unnecessarily.
- Premature caching.
- Speculative optimization.

Prefer:

- Measurement first.
- Batching.
- Indexing.
- Pagination.
- Reducing unnecessary work.

### Code Quality

Rules:

- Names describe intent.
- One function has one responsibility.
- Comments explain why, not what.
- Prefer readability over cleverness.
- Keep files focused.
- Avoid hidden side effects.
- Match project conventions.
- Delete unused code.
- Avoid abstractions without real use.

Good code should be obvious, small, testable, boring, and easy to remove.

## 12. Engineering Workflow Rules

### Loop Engineering

Work in tight feedback loops.

Default loop:

1. Read.
2. Diagnose.
3. Patch.
4. Verify.
5. Decide.

For every non-trivial task, each loop must answer:

- What changed?
- Why was it changed?
- How was it verified?
- What did we learn?
- Is another loop justified?

Before starting another loop, ask:

- What can be deleted?
- What can be deduped?
- What can be simplified?
- Is more work justified by evidence?

Rules:

- One loop has one clear objective.
- Prefer the smallest safe patch.
- Verify after each meaningful change.
- Stop when the objective is met.
- Do not continue refactoring without evidence.
- If verification fails, diagnose before patching again.
- If the same issue repeats, identify the root cause before another patch.

Exit conditions:

- Objective is met.
- Tests or checks pass, or failures are explained.
- Remaining work is clearly out of scope.
- Further changes would be speculative.

Never start a new loop without knowing why.

### Before Editing Code

Before editing, read project instructions and relevant documentation such as:

- `AGENTS.md`.
- `CLAUDE.md`.
- `.cursorrules`.
- `README.md`.
- BrainOS governance files.

Then:

1. Read relevant source code.
2. Understand existing architecture.
3. Identify what is broken.
4. Find the root cause.
5. Choose the smallest fix.
6. Check impact.
7. Explain why this fix is appropriate.

If unclear, ask first. Never edit before reading.

### During Implementation

Rules:

- Make the smallest useful change.
- Keep changes scoped.
- Avoid unrelated cleanup.
- Avoid drive-by refactors.
- Preserve existing behavior unless asked to change it.
- Reuse existing utilities and patterns.
- Prefer project-native tooling.
- Verify after meaningful changes.

When choosing between two solutions, prefer:

- Less code.
- Fewer moving parts.
- Easier rollback.
- Code the current team can maintain.

## 13. Tool Priority Rules

Priority:

1. CLI.
2. Project-native tooling.
3. Semantic or LSP search.
4. Grep or glob search.
5. Guessing from memory.

Rules:

- Read real code before assumptions.
- Use existing tests and checks first.
- Prefer project scripts over invented commands.
- Do not rely on memory when the answer exists in the repository.

## 14. Feedback Rules

Adapt behavior continuously.

If the user says "wrong", do not repeat the same mistake.

If the user says "good" or "perfect", treat the validated approach as a project pattern unless it conflicts with higher-priority governance.

## 15. Output Style Rules

Use:

- Concise responses.
- Technical explanations.
- Code blocks.
- Tables when useful.
- Clickable file references where supported.

Avoid:

- Fluff.
- Unnecessary repetition.
- Pretending tradeoffs do not exist.

For completed tasks, include the following when they materially affect user decisions, operations, risk, or future maintenance:

- Pros: improvements gained.
- Cons or risks: tradeoffs, edge cases, or operational risks.
- Recommendations: next validation steps, monitoring, or future cleanup.

## 16. BrainOS Repository Protection Rules

The BrainOS central repository is the canonical governance source.

Canonical repository:

```text
https://github.com/chaluempon/BrainOS.git
```

For child projects and downstream projects, BrainOS must be treated as read-only unless the user explicitly states that the current task is to maintain or update BrainOS itself.

Child projects, downstream projects, and AI agents must not:

- Modify the BrainOS central repository.
- Edit the canonical `GLOBAL_RULES.md`.
- Commit to the BrainOS central repository.
- Push to the BrainOS central repository.
- Create pull requests to the BrainOS central repository.
- Change files outside the current project directory.
- Copy local project assumptions back into BrainOS without explicit approval.

AI agents may read BrainOS only as an external governance reference during project-local work.

When applying BrainOS to another project:

- Work only inside the current project directory.
- Create project-local governance files under `BRAINOS/`.
- Record the canonical BrainOS source in `BRAINOS/BRAINOS_ADOPTION.md`.
- Do not clone BrainOS into the child project unless explicitly requested.
- Do not overwrite, delete, rename, or move existing project files unless explicitly requested.
- Do not modify application code unless the user explicitly requests implementation work.
- If there is uncertainty about whether a file belongs to the BrainOS central repository or the current project, ask before editing.

## 17. Change Control Rules

Material changes to governed AI systems must update the relevant BrainOS documents. A material change includes any change to:

- Purpose or scope.
- Agent responsibilities.
- Workflow behavior.
- Data sources.
- External dependencies.
- Security or privacy assumptions.
- Deployment or operational model.
- Engineering architecture or implementation approach.

Changes to the BrainOS central repository itself require explicit approval and should document:

- Change summary.
- Reason for change.
- Affected documents.
- Compatibility impact for child projects.
- Review owner.
- Effective date.

## 18. Evaluation Rules

AI systems must define success criteria before operational use. Evaluation may include quality, reliability, latency, cost, safety, compliance, human review rate, and business impact.

Evaluation results must be documented when they influence project approval, redesign, or retirement.

## 19. BrainOS Foundation Restrictions

BrainOS itself is a governance and knowledge foundation. It must not contain business logic, application code, databases, containers, APIs, secrets, or production infrastructure unless explicitly approved by a future BrainOS governance decision.

## 20. Compliance Checklist

Before any standard or high-risk AI project is considered governed by BrainOS, confirm the applicable items below. For low-risk reversible tasks, confirm the acceptance contract, repository boundary, required verification, and invariant security controls without creating unrelated governance artifacts:

- The project has a charter.
- Architecture is documented.
- Agents are registered.
- Workflows are documented.
- Dependencies are inventoried.
- APIs and integrations are cataloged.
- Risks and KPIs are defined.
- Ownership is assigned.
- Documentation is current.
- Global rules have been reviewed.
- Engineering work follows the smallest verified change principle.
- BrainOS central repository is treated as read-only during child project work.
- Project-local BrainOS files live under the current project's `BRAINOS/` directory.
