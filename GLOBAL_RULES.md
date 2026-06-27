# BrainOS Global AI Engineering Rules

**Document Status:** Active Standard  
**Authority:** Single Source Of Truth  
**Last Updated:** 2026-06-27

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

## 2. Core Governance Principles

1. **Governance first:** No AI project may proceed without documented ownership, scope, architecture, dependencies, risks, and review status.
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

Every AI project governed by BrainOS must maintain:

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

Every AI agent must be registered before use in a governed project. The registry must define:

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

## 9. Engineering Execution Rules

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

## 10. Quality Rules

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

## 11. Engineering Workflow Rules

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

## 12. Tool Priority Rules

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

## 13. Feedback Rules

Adapt behavior continuously.

If the user says "wrong", do not repeat the same mistake.

If the user says "good" or "perfect", treat the validated approach as a project pattern unless it conflicts with higher-priority governance.

## 14. Output Style Rules

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

For non-trivial completed tasks, include:

- Pros: improvements gained.
- Cons or risks: tradeoffs, edge cases, or operational risks.
- Recommendations: next validation steps, monitoring, or future cleanup.

## 15. Change Control Rules

Material changes to governed AI systems must update the relevant BrainOS documents. A material change includes any change to:

- Purpose or scope.
- Agent responsibilities.
- Workflow behavior.
- Data sources.
- External dependencies.
- Security or privacy assumptions.
- Deployment or operational model.
- Engineering architecture or implementation approach.

## 16. Evaluation Rules

AI systems must define success criteria before operational use. Evaluation may include quality, reliability, latency, cost, safety, compliance, human review rate, and business impact.

Evaluation results must be documented when they influence project approval, redesign, or retirement.

## 17. BrainOS Foundation Restrictions

BrainOS itself is a governance and knowledge foundation. It must not contain business logic, application code, databases, containers, APIs, secrets, or production infrastructure unless explicitly approved by a future BrainOS governance decision.

## 18. Compliance Checklist

Before any AI project is considered governed by BrainOS, confirm:

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
