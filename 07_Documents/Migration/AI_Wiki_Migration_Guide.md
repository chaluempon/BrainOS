# Ai_WiKi Migration Guide

1. Verify restore point and record its path.
2. Read both repositories' instructions and capture Git state.
3. Inventory all assets and approve mapping.
4. Copy into staging; never alter the source repository.
5. Normalize only metadata and placement necessary for BKOS.
6. Record every copy in a manifest with size and SHA-256.
7. Validate counts, checksums, UTF-8/Thai, links, duplicates, Obsidian configuration, secrets, and Git diff.
8. Cut over `01_Knowledge` only after validation.
9. Keep Ai_WiKi untouched until explicit archive/deletion authorization.
10. Do not commit or push without separate authorization.
