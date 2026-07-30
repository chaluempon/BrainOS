# Wiki Agent Rules & Configuration

## Format Handlers

Agent will automatically detect file format and process accordingly:

### Markdown (.md)
- **Detection:** File extension = `.md`
- **Import strategy:** Direct import
- **Processing:**
  1. Read file content
  2. Extract headings as sections
  3. Extract tags from front matter or content
  4. Identify entities (words appearing 2+ times)
  5. Create/update source page
  6. Link to entities and topics
- **Output:**
  - `sources/filename.md` (source metadata + summary)
  - `entities/entity-name.md` (if new entity detected)
  - `topics/topic-name.md` (if theme detected)

### Text (.txt)
- **Detection:** File extension = `.txt`
- **Import strategy:** Parse structure
- **Processing:**
  1. Split by line breaks into paragraphs
  2. Identify key phrases (first line of each paragraph)
  3. Extract entities from content
  4. Group by logical sections
- **Output:**
  - `sources/filename.md` (converted to structured markdown)
  - `entities/entity-name.md` (auto-create if mentioned 2+ times)

### PDF
- **Detection:** File extension = `.pdf`
- **Import strategy:** Extract text + images
- **Processing:**
  1. Extract text from each page
  2. Detect chapter boundaries (if any)
  3. Extract images separately
  4. Identify entities across all pages
- **Output:**
  - `sources/filename.md` (full text summary)
  - `wiki/topics/filename-chapter-N.md` (per chapter)
  - `wiki/assets/` (images)

### URLs (http://, https://)
- **Detection:** Line in `raw/urls.txt` format: `http://...`
- **Import strategy:** Fetch + convert HTML → markdown
- **Processing:**
  1. Fetch URL
  2. Extract title, metadata, content
  3. Convert HTML → markdown
  4. Identify entities
- **Output:**
  - `sources/url-title.md` (converted to markdown)
  - `entities/entity-name.md` (if new)

---

## Entity Rules

Entities are semantic units (people, concepts, places, events):

- **Auto-create:** When mentioned 2+ times in a source
- **Front matter tags:**
  ```yaml
  type: person | concept | place | event
  related: [entity1, entity2]  # Cross-references
  ```
- **Linking:** Auto-link to all sources that mention this entity
- **Updating:** When new source mentions entity, update entity page with new information

---

## Topic Rules

Topics are knowledge units (summaries, analyses, themes):

- **Auto-create:** When major theme detected across sources
- **Front matter:**
  ```yaml
  type: topic | summary | analysis | synthesis
  source_count: N
  related: [topic1, entity1]
  ```
- **Content:** Synthesized summary from multiple sources
- **Updating:** When new related source arrives, update with new information and citations

---

## Linking Rules

- **Bidirectional:** If page A mentions B, page B should mention A
- **Format:** `[[entity-name]]` or `[[topic-name]]`
- **Auto-detect:** Parse content for entity/topic names, auto-create links
- **Consistency:** Keep cross-references synchronized

---

## Index & Log Updates

- **index.md:** Update after every ingest (add new entries)
- **log.md:** Append entry after every ingest with:
  - Date and action (ingest, query, lint)
  - Files created/updated
  - New entities found
  - Status (✓ Complete or ⚠️ Issues)

---

## Maintenance Rules

- **Monthly lint:** Check for orphan pages, broken links, contradictions
- **Tag consistency:** Keep tag names consistent across wiki
- **Archive:** Move processed files from `raw/` to `.archive/`

---

## Software Project Standard Rules

When this vault is used as a standard for AI agents creating or refactoring software projects, the agent must read and apply:

1. `wiki/topics/software-engineering-project-standard.md`
2. `wiki/topics/ai-agent-software-delivery-playbook.md`
3. `wiki/topics/secure-software-engineering-checklist.md`

### Required Agent Behavior

- Identify project type, runtime, framework, data stores, external integrations, and trust boundaries before creating files.
- Choose a project structure intentionally: Clean Architecture, Vertical Slice Architecture, framework-native structure, or a small-tool layout.
- Keep domain/business logic separate from infrastructure and interface code.
- Add or preserve tests that match the risk of the change.
- Add repository safety files for real projects: `README.md`, `.env.example`, `.gitignore`, `SECURITY.md`, and CI workflow where applicable.
- Never commit real secrets, credentials, tokens, cookies, private keys, or production environment files.
- Use secure defaults: input validation, parameterized queries or safe ORM APIs, least privilege, safe logging, and dependency scanning.
- Before final delivery, report verification commands, security notes, remaining risks, and changed files.

### Required Security Baselines

- Use OWASP ASVS for web application and API security requirements.
- Use OWASP Secure Coding Practices as the secure coding checklist.
- Use OWASP SAMM for secure SDLC maturity and process improvement.
- Use CodeQL, Dependabot, secret scanning, and dependency review for GitHub repositories when available.

---

## How to Modify Rules

If you want to change how Agent processes sources:

1. Edit this file
2. Update relevant section (e.g., "PDF Processing")
3. Agent will apply new rules on next ingest
4. No restart needed

**Example:** To add support for `.docx` files:

```markdown
### Word (.docx)
- Detection: File extension = `.docx`
- Processing: Convert to markdown, then same as .md
- Output: sources/filename.md
```

Then add this section, and agent will handle `.docx` on next ingest.
