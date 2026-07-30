# Decision: BrainOS Repository Is Foundation Only

**Date:** 2026-06-27
**Status:** Approved
**Owner:** BrainOS Governance

## Decision

The `BrainOS` repository is reserved for central governance and knowledge foundation work only.

It must be used for:

- Global rules.
- Governance standards.
- Architecture guidance.
- Templates.
- Registries.
- Workflow documentation.
- Knowledge records.
- Project adoption guidance.

It must not be used for:

- Runtime application code.
- Business logic.
- Databases.
- API services.
- Docker containers.
- Production infrastructure.
- Secrets or operational credentials.

## Reason

BrainOS needs to remain a stable source of truth for rules and governance. Runtime services will grow independently and should not make the foundation repository harder to audit, publish, or reuse.

## Runtime Direction

If a runnable BrainOS platform is needed, create it as a separate project or repository, for example `BrainOS_Platform`.

The platform may:

- Serve BrainOS rules through APIs.
- Provide memory, registry, audit, prompt, workflow, or model routing services.
- Run as Docker containers on a server.
- Integrate with API Gateway and MSSQL.

The platform must not replace this repository as the canonical governance source unless a future governance decision explicitly changes that role.

## Compatibility Impact

Existing projects should continue to reference BrainOS as a read-only governance source. Runtime integrations should target the separate BrainOS Platform service when it exists.
