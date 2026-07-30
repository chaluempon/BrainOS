# BrainOS Deployment

**Document Status:** Foundation Deployment Guidance  
**Last Updated:** 2026-06-21

BrainOS has no deployable application components. Deployment for BrainOS means controlled publication and adoption of governance documents, templates, registries, and standards.

## Current Deployment Model

| Area | Current State |
| --- | --- |
| Application runtime | None |
| Databases | None |
| APIs | None |
| Containers | None |
| Infrastructure | None |
| Deployment artifact | Markdown documentation structure |

## Runtime Boundary

BrainOS foundation is not deployed as an application container. It is published as governed documentation.

Runtime capabilities such as APIs, memory services, agent execution, model routing, workflow execution, logs, metrics, and database integrations must live in a separate project or repository, for example `BrainOS_Platform`.

Other projects may read BrainOS rules from the published repository or from a future BrainOS Platform API, but they must not treat this foundation repository as a runtime service.

## Publication Guidance

BrainOS documents should be published through approved organizational repositories, document portals, or knowledge systems. The published version must remain consistent with `GLOBAL_RULES.md`.

## Adoption Guidance

Future projects adopting BrainOS should:

- Reference `GLOBAL_RULES.md`.
- Use BrainOS templates for project, module, agent, and workflow documentation.
- Register agents before operational use.
- Catalog APIs and dependencies before integration approval.
- Preserve lessons learned in the knowledge base.

## Release Governance

Material changes to BrainOS standards should record:

- Change summary.
- Reason for change.
- Affected documents.
- Review owner.
- Effective date.
