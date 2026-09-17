# ผลอัปเดต Global Rules v2.4.0

## ขอบเขตและสถานะ

DONE สำหรับต้นฉบับและชุดเผยแพร่ในเครื่อง ไม่รวม Commit/Push การเปลี่ยน Production หรือสิทธิ์ระบบ

- เดิม: v2.3.0 ซึ่งยังไม่ Commit
- ใหม่: v2.4.0 มีผล 15 กันยายน 2026
- Git baseline คงเดิม: `d0564e3d3ed13fb71ad67a1e41a4473dd669ef79` (v2.2.0)
- SHA-256 ต้นฉบับใหม่: `134b14a98819a381df470e51fb3038610ba9177fb82cf4e6fcb3040dbb8f052b`
- สำเนา Markdown ใน OneDrive บนเครื่องตรงกับต้นฉบับทุก byte; ไม่ได้ยืนยันการซิงค์ cloud หรือสิทธิ์แชร์ของ OneDrive

## เทียบข้อกำหนดในภาพกับสิ่งที่แก้

| ข้อ | ก่อนหน้า | การปรับที่ตรวจแล้ว |
| --- | --- | --- |
| 1. พร้อมก่อนงานยาว | มี resumption แต่ยังไม่ชัดเรื่อง critical-path preflight | §1.8 ตรวจ workspace, สิทธิ์, route และปลายทางแบบจำกัดก่อนขั้นตอนใช้เวลามาก |
| 2. เส้นทางสั้นที่สุด | มี tool priority | §13 ใช้ tools/scripts ตรงกับงานเชิงกล ไม่เรียก AI เพิ่มหากไม่มีเหตุผลวิเคราะห์ |
| 3. จำกัด handoff | ยังไม่มีข้อกลางชัด | §1.8 single writer ต่อทรัพยากร ขอบเขตขนานไม่ชน ส่งบริบทจำเป็น ห้าม nested reviewers |
| 4. จำกัดรอบรีวิว | มีเพดาน 2 รอบแล้ว | §1.5 ยืนยันว่าเป็นเพดาน ไม่ใช่ต้องใช้ครบ; nonblocking ไม่หน่วงงาน และห้ามเปลี่ยน agent เพื่อรีเซ็ตจำนวนรอบ |
| 5. เดินต่อแม้คำถามแทรก | มี continuation ตาม scope | §1.4 เก็บ acceptance state ทำต่อ แต่เคารพ stop/reorder/scope change ทันที |
| 6. แสดงความคืบหน้า | ยังไม่มี ownership ของ background ชัด | §1.8 รายงานผลจริงตามช่วง งาน background มี consumer, handle, deadline และติดตามผล |
| 7. ไม่เชื่อ exit0/DONE ลอย ๆ | มีเกณฑ์ DONE | §1.4 ตรวจ artifact/tests/readback และผูกกับ revision/checksum ปัจจุบัน |
| 8. ไม่ลดความปลอดภัย | มี invariants และ owner gates | §1.8 ห้าม blanket permission ปิด host/auth verification ตัด backup หรือข้าม tests เพื่อเร่งงาน |
| 9. แยกกฎกับวิธีทำ | มี skill maintenance | §5 model IDs, CLI, timeout, permission และ deploy อยู่ใน skills/runbooks ตาม routing ล่าสุดของเจ้าของ |
| 10. วัดเวลาจริง | มี evaluation ทั่วไป | §18 บันทึก elapsed และส่วนรอ/อ่านซ้ำ/review/rework เมื่อวัดได้ ระบุ unknown และห้ามอ้างเร็วขึ้นโดยไม่มี baseline |

ไฟล์ diff จริง: [GLOBAL_RULES-v2.3.0-to-v2.4.0.diff](GLOBAL_RULES-v2.3.0-to-v2.4.0.diff)

## การตรวจความสอดคล้อง

- independent review ผ่าน `agy` route `gemini-3.8-flash-high`: PASS ไม่มี mandatory blocker; เก็บใน `review.txt`
- ตรวจ hash ของกฎก่อนและหลัง review ตรงกัน
- เนื้อหา Security, Repository Protection, Rule Precedence และ Approval Authority เดิมเทียบกับ snapshot แล้วไม่เปลี่ยน
- ไม่ hard-code route โมเดลใหม่ใน Global Rules และไม่แก้ routing/profile/ระบบสิทธิ์
- `git diff --check` ผ่าน หัวข้อหลัก 1–20 ครบ
- `AGENTS.md` และ Project Starter ไม่เปลี่ยนในรอบนี้: tool ขอ approval สำหรับ AGENTS แล้วหมดเวลารอ จึงไม่ได้ retry หรือข้าม gate; AGENTS เดิมยังสั่งอ่าน GLOBAL_RULES ก่อน
- Index และ HEAD ไม่เปลี่ยน ไม่มี Commit/Push

## Workflow ตัวอย่างที่รันจริง

คำสั่ง: `python3 -B outputs/global-rules-v2.4.0/safe_workflow_example.py`

เป็นตัวอย่าง deterministic ใน TemporaryDirectory ไม่มีเครือข่าย secret หรือระบบจริง มี checks ผ่าน 8 รายการ:

1. สร้างและตรวจ preflight/backup ของไฟล์ fixture
2. ปฏิเสธ worker ที่ exit 0 และพิมพ์ SUCCESS แต่ไม่มี artifact
3. ติดตาม single writer PID 84815 ด้วย parent consumer และ deadline 5 วินาที จน process จบและ artifact ตรง
4. Copy แล้วอ่านกลับปลายทางในพื้นที่ชั่วคราว เทียบเนื้อหาและ hash
5. จับ artifact ที่ถูก tamper หลังตรวจ
6. แก้ภายใน scope และตรวจซ้ำผ่าน
7. Restore ไฟล์แล้วเทียบ byte
8. ยืนยันพื้นที่ชั่วคราวถูกล้างหลังจบ

ผลจริงอยู่ใน `safe-workflow-results.json` ไม่ใช่ output จำลองจาก API

### สิ่งที่ยังไม่พิสูจน์

- LLM ทำงานต่อได้ถูกต้องเมื่อผู้ใช้ถามแทรกจริงทุกสถานการณ์
- ทุก agent หรือระบบ Production enforce กฎนี้อัตโนมัติ
- เวลางานลดลงเมื่อเทียบ baseline

ไม่ใช้ผล script เป็นหลักฐานแทนสามข้อข้างต้น

## เอกสารเผยแพร่

อัปเดต `/Users/dojo/Documents/เอกสาร BrainOS`:

- README และ HTML sources
- Infographic PNG 1600 × 2600
- PDF 9 หน้า พร้อมหน้าสรุปหลักการทั้ง 10 ข้อ
- Preview v2.4.0 และภาพหน้าปกชื่อเดิม

ตรวจ geometry ของ PNG, text layer และขอบเขตข้อความ PDF พร้อม visual QA ครบ ไม่พบข้อความตัด/ทับหรือตารางล้นที่เป็น blocker; การตัดคำบางจุดและ footer ขนาดเล็กเป็นข้อสังเกตไม่บล็อก

## เวลาและข้อจำกัดการวัด

- เริ่มที่เครื่องยืนยัน: 2026-09-15 16:17:38 +07:00
- local acceptance verified: 2026-09-15 16:33:09.560395 +07:00
- observed elapsed: 931.560395 วินาที (รวมเวลารอ approval และ tool roundtrips)
- independent review: 39.586004166 วินาที
- sandbox example: 0.026798292 วินาที
- breakdown เวลารอ approval, อ่านซ้ำ และแก้งานอื่น: unknown เพราะไม่ได้ instrument แยกตั้งแต่เริ่ม ไม่ใช่ศูนย์
- เวลาข้างต้นไม่ใช่หลักฐานว่าเร็วขึ้น และไม่รวมเวลาจัดทำรายงานหลัง acceptance

## ถอยกลับอย่างปลอดภัย

Snapshot: `/Users/dojo/.hermes/restore-points/BrainOS/20260915T161903+0700-before-v2.4.0`

ไฟล์ rollback: `repository/GLOBAL_RULES.md` v2.3.0

SHA-256: `427ab569144f63431839d6e638dd391d3b7e92334426dbd881baa1d441134803`

ตรวจสำเนา, reverse-check ของ dirty patch, Git bundle และ ZIP แล้ว พร้อมทดลองคืนไฟล์ v2.3.0 ในพื้นที่ชั่วคราวโดยไม่แตะต้นฉบับ ต้องสำรองงานใหม่กว่าและคืนเฉพาะ scope ที่อนุมัติ ห้ามใช้ Git baseline v2.2.0 แทนไฟล์ v2.3.0 หรือ reset ทั้ง Repository
