# ผลอัปเดต BrainOS Global Rules v2.5.0

## สถานะ

`DONE_LOCAL_AND_READER_PUBLICATION` — canonical working file, OneDrive reader Markdown และ reader package อัปเดตและตรวจแล้ว ไม่มี Commit, Push, Pull Request, Production change หรือ permission change.

## กฎที่เพิ่ม

เพิ่ม `GLOBAL_RULES.md` §1.9 ให้ทุกงานโปรเจกต์ที่เปลี่ยน durable state ต้องอัปเดต current continuation checkpoint และ durable task list ก่อนตอบจบ เมื่อทำสำเร็จ พัก ติด blocker เปลี่ยน scope ส่งต่อ หรือถึง session/context boundary.

Agent รอบถัดไปต้องอ่าน Global/Project Rules ที่บังคับ แล้วอ่าน checkpoint และ task list ล่าสุดก่อน ตรวจ freshness แบบจำกัด และทำต่อจาก first pending action. หาก checkpoint ยังตรงและครบ ห้ามเริ่มอ่าน README ทั้งหมด ประวัติเก่า repository หรือ knowledge base ใหม่โดยไม่มีเหตุผล.

Checkpoint ไม่แทน live verification และไม่ข้าม security, privacy, repository boundary, one-writer, owner gate หรือ secret-handling rules.

## หลักฐาน

- Canonical SHA-256: `7535d716eb54056cf77cffdfc6ef99835cc35b1843189542c6d0aa579c71f76e`
- v2.4.0 → v2.5.0 diff SHA-256: `44f21c09131e8dee5097b442f9e29eccb7f91d72bafe7226182501a5aabc7cfe`
- Independent closure review: `PASS`, mandatory blockers `0`
- Canonical ↔ OneDrive Markdown: byte-identical
- Infographic: `1600 × 2600`, visual QA `PASS`
- Detailed PDF: `10 หน้า`, text markers/bounds `PASS`, visual QA `PASS`
- PDF orphan-footer blocker found on first render, removed, rerendered, and stale page-11 preview deleted
- `git diff --check`: `PASS`

## Restore

- Restore point: `/Users/dojo/.hermes/restore-points/BrainOS/20260917T090651+0700-before-v2.5.0`
- Exact v2.4.0 SHA-256: `134b14a98819a381df470e51fb3038610ba9177fb82cf4e6fcb3040dbb8f052b`
- Full Git bundle SHA-256: `badc8b214c31ca85c336ce15869f39a4969757da8198fad4f546106c73e9cc96`
- Git baseline remains v2.2.0 commit `d0564e3d3ed13fb71ad67a1e41a4473dd669ef79`; it is not a substitute for the uncommitted v2.4.0 rollback file.

## งานถัดไป

Owner-only decision: whether to authorize a separate branch/commit/PR/merge workflow. Until explicitly requested, do not publish v2.5.0 to GitHub.
