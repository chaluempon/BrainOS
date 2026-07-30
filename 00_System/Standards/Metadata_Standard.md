# Metadata Standard

**Status:** Active standard

Minimum frontmatter for canonical notes:

```yaml
---
id: stable-id
title: Human-readable title
aliases: []
domain: Engineering
category: Reference
knowledge_type: canonical
status: draft
access_level: internal
source_type: migrated
sources: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
language: th
---
```

Allowed lifecycle values: `inbox`, `draft`, `under_review`, `approved`, `published`, `needs_update`, `deprecated`, `archived`, `rejected`.

Allowed access levels: `public`, `internal`, `confidential`, `restricted`.

Migrated notes default to `draft` and `internal` until a human review confirms sources, accuracy, and classification.
