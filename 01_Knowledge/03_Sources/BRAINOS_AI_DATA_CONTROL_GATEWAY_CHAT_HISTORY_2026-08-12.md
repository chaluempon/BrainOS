---
title: "BrainOS — AI Data Control, API Gateway และ MCP Server"
type: "source"
source_type: "chat_history"
date: 2026-08-12
tags: [brainos, data-governance, api-gateway, mcp, security, human-approval]
related_topics: [ai-data-control, api-gateway, mcp-server, access-control]
aliases: ["AI Data Control Gateway Chat History"]
status: draft
access_level: internal
migration_date: 2026-08-16
domain: Sources
knowledge_type: source
---

# BrainOS — AI Data Control, API Gateway และ MCP Server

**วันที่ต้นทาง:** 12 สิงหาคม 2569

**สถานะ:** Source draft; ยังไม่ใช่ข้อเท็จจริงหรือสถาปัตยกรรมที่อนุมัติแล้ว

> [!IMPORTANT]
> เอกสารนี้เก็บข้อเสนอจากประวัติการสนทนาเพื่อรักษาที่มา เนื้อหาด้าน runtime ต้องตรวจสอบกับ repository จริงก่อนใช้งาน และต้องนำไปออกแบบใน `BrainOS_Platform` ไม่ใช่ repository BrainOS ซึ่งเป็น governance และ curated-knowledge foundation

## 1. จุดเริ่มต้น

องค์กรเริ่มใช้ AI มากขึ้น จึงต้องวางระบบ Data Control เพื่อให้ข้อมูลลูกค้า เอกสารภายใน ข้อมูล HR/การเงิน และ ERP ไม่รั่วหรือถูก AI Agent ใช้งานเกินสิทธิ์

เป้าหมายไม่ใช่ห้ามพนักงานใช้ AI แต่ทำให้ใช้ได้เร็วและปลอดภัย โดยข้อมูลและการกระทำที่แตะระบบบริษัทต้องมีสิทธิ์และมีร่องรอย

## 2. หลักการควบคุมข้อมูล

1. AI อ่านหรือสรุปข้อมูลได้เท่าที่ผู้ใช้หรือ Agent มีสิทธิ์
2. งานส่งออก แก้ไขข้อมูล หรือทำรายการจริง ต้องมี Human Approval
3. ข้อมูลส่วนบุคคล/ลับต้องถูก mask ก่อนส่งไปยัง LLM ภายนอก
4. AI Agent ห้ามต่อ ERP, MSSQL, SharePoint หรือ LINE OA โดยตรง
5. ทุก Agent ต้องใช้บริการกลางของ BrainOS เพื่อคุมสิทธิ์, log และ approval

## 3. Data Classification ที่เสนอ

| ระดับ | ตัวอย่าง | กติกา |
|---|---|---|
| P0 สาธารณะ | เนื้อหาเว็บไซต์/โพสต์บริษัท | ใช้ AI ได้ |
| P1 ภายใน | SOP ทั่วไป, รายงานที่ไม่มีชื่อบุคคล | ใช้ผ่านบัญชีองค์กร |
| P2 จำกัด | ยอดขายรายคัน, Ticket IT, ราคาภายใน | ใช้ตามสิทธิ์ ผ่าน BrainOS |
| P3 ลับ/ข้อมูลส่วนบุคคล | ชื่อและเบอร์ลูกค้า, เลขบัตร, เงินเดือน, เลขบัญชี, ERP ดิบ, password | ห้ามส่ง AI ภายนอกโดยตรง; ต้องใช้ระบบอนุมัติและ mask ข้อมูล |

## 4. ความเข้าใจเรื่อง CrowdStrike

CrowdStrike ช่วยตรวจจับ/บล็อกพฤติกรรมอันตรายบน Notebook และ Server เช่น malware, credential theft, privilege escalation และ lateral movement

แต่ CrowdStrike ไม่ใช่ตัวตัดสินโดยตรงว่า AI Agent ที่มี credential ถูกต้อง “ควร” อ่านหรือแก้ข้อมูลใดใน ERP

ดังนั้นต้องใช้ร่วมกัน:

| สิ่งที่ต้องคุม | ตัวคุมหลัก |
|---|---|
| Agent เข้าระบบหรือข้อมูลใดได้ | BrainOS API Gateway + สิทธิ์/service account |
| Agent เรียก Tool ใดได้ | MCP Server + policy |
| งานแก้ข้อมูล/ส่งลูกค้า | Approval Workflow |
| เครื่องหรือ Agent ถูกเจาะ | CrowdStrike + MDM/Endpoint policy |

## 5. ข้อสรุป API vs MCP

ไม่ต้องเลือกระหว่าง API หรือ MCP เพราะใช้คนละหน้าที่

```text
Claude / Codex บน Notebook
          │ MCP
          ▼
BrainOS MCP Server 01
          │ API
          ▼
BrainOS API Gateway 01
          │
          ▼
ERP / MSSQL / SharePoint / OneDrive / LINE OA
```

- **API** = ทางเชื่อมระบบกับระบบ; ใช้ให้ BrainOS คุยกับ ERP, MSSQL, SharePoint, LINE และบริการภายใน
- **MCP** = ทางเชื่อมระหว่าง AI Agent กับ Tools ของ BrainOS; ทำให้ Claude/Codex เรียกคำสั่งที่อนุญาตได้
- **API Gateway** = ด่านกลางคุม authentication, authorization, rate limit, audit log, data masking และ approval
- **MCP Server** = ประกาศ Tool ที่ AI Agent เรียกได้ และส่งต่อไป API Gateway เท่านั้น

## 6. สิ่งที่มีอยู่เดิม

ประวัติการสนทนาระบุว่ามี `API Gateway 01` แล้ว แต่ยังไม่มีหลักฐานยืนยันตำแหน่ง repository หรือสถานะการทำงาน

การตรวจ repository BrainOS เมื่อ 2026-08-16 ไม่พบ runtime directory หรือ implementation ของ API Gateway ซึ่งสอดคล้องกับข้อจำกัดของ BrainOS foundation

**ข้อควรทำก่อนเริ่ม:** ตรวจ `BrainOS_Platform` หรือ runtime repository ที่ได้รับอนุมัติแบบ read-only เพื่อยืนยันว่า API Gateway 01 มีอยู่จริงและทำงานถึงระดับใด โดยไม่สร้างซ้ำจากข้อสันนิษฐานในแชต

## 7. สิ่งที่ต้องเพิ่ม

ข้อเสนอ runtime ต่อไปนี้ต้องอยู่ใน `BrainOS_Platform` หรือ runtime repository ที่ได้รับอนุมัติ ไม่ใช่ repository BrainOS และไม่ควรอยู่ใน BrandOS

```text
BrainOS_Platform/
├─ platform/
│  ├─ api-gateway-01/        # ต้องตรวจสถานะก่อน
│  ├─ mcp-server-01/         # ข้อเสนอ; ยังไม่อนุมัติให้สร้าง
│  ├─ identity-access/
│  ├─ audit-log/
│  ├─ approval-workflow/
│  ├─ monitoring/
│  └─ ai-operations-agent-01/
│
├─ projects/
│  ├─ sales-radar/
│  ├─ it-service-bot/
│  └─ lead-to-money/
│
└─ docs/
```

BrainOS เก็บเฉพาะ charter, architecture decision, catalog, risk, policy และ knowledge ที่ผ่านกระบวนการกำกับดูแลของข้อเสนอนี้

## 8. การทำงานกับ Notebook ของ User

Claude/Codex อยู่บน Notebook แบบ stand-alone ได้ตามปกติ ไม่ต้องติดตั้ง BrainOS Gateway บนเครื่องพนักงาน

สิ่งที่ต้องมีบนเครื่อง User:

1. ใช้บัญชีองค์กรผ่าน Microsoft 365/SSO
2. ใช้ Claude หรือ Codex ตามปกติ
3. เพิ่มการเชื่อมต่อ MCP ไปยัง BrainOS MCP Server 01

ลำดับการทำงาน:

1. User สั่ง Claude/Codex เช่น “ค้นหา Lead ของฉัน”
2. Agent เรียก MCP Tool `search_my_leads`
3. MCP Server ส่งคำขอเข้าหา API Gateway 01
4. Gateway ตรวจว่า User คือใคร อยู่แผนกใด และมีสิทธิ์ใด
5. Gateway เรียก API ของ Sales Module
6. Sales Module ส่งเฉพาะข้อมูลที่ User มีสิทธิ์กลับมา

**ห้ามแจก API key กลางให้ User ใส่เอง** ให้ใช้ SSO/token อายุสั้น และกำหนดสิทธิ์ตาม User/Role

หมายเหตุ: Gateway คุมการเข้าถึง “ระบบบริษัท” ได้ แต่ไม่คุมทุกการทำงานกับไฟล์ใน Notebook ของ User. การคุม Notebook ใช้ MDM, สิทธิ์เครื่อง และ CrowdStrike ร่วมกัน

## 9. กฎสำคัญของ MCP Server 01

1. MCP Server 01 ห้ามต่อ MSSQL/ERP โดยตรง
2. MCP Tool ทุกตัวต้องเรียก API Gateway 01
3. ใช้ VPN/Zero-Trust หรือเครือข่ายบริษัทในการเข้าถึง MCP; ห้ามเปิด MCP สู่ Internet สาธารณะโดยไม่มีการคุมสิทธิ์
4. ทุก Tool ใช้สิทธิ์ต่ำสุด (least privilege)
5. เริ่มจาก read-only หรือ create ที่ความเสี่ยงต่ำ
6. การ write/execute ที่เสี่ยงต้องผ่าน Approval Workflow

## 10. Tool รุ่นแรกที่แนะนำ

เริ่มเฉพาะ 3 Tool เพื่อทดลองกับ User 2–5 คน:

| MCP Tool | หน้าที่ | สิทธิ์ |
|---|---|---|
| `search_sop` | ค้นหาคู่มือ/SOP ที่เผยแพร่แล้ว | Read-only |
| `search_my_leads` | ดู Lead เฉพาะของ User ที่ login | Read-only ตามสิทธิ์ |
| `create_it_ticket` | เปิด Ticket IT ใหม่ | Create เฉพาะ ticket |

ยังไม่เปิด Tool ต่อไปนี้ในระยะแรก:

- แก้ ERP
- ส่ง LINE หาลูกค้า
- อนุมัติส่วนลด
- เปลี่ยนข้อมูลการเงิน/บัญชี
- แก้สิทธิ์หรือ config ระบบ

## 11. AI Operations Agent 01

ควรมี AI Operations Agent กลาง **1 ตัว** ดูแลทั้ง API Gateway 01 และ MCP Server 01 ไม่ต้องมี Agent เต็มสิทธิ์ประจำแต่ละ Server

สิ่งที่ Agent ทำได้ช่วงแรก:

- ตรวจ API/MCP online/offline
- ตรวจ CPU, RAM, Disk, Docker container และ error rate
- ตรวจการเรียก MCP ผิดปกติหรือการถูกปฏิเสธสิทธิ์ซ้ำมาก
- สรุป error log เป็นภาษาไทย
- แจ้ง Telegram/LINE กลุ่ม IT
- เปิด IT Ticket อัตโนมัติ

สิ่งที่ห้ามทำเอง:

- Restart server หรือ database
- แก้ firewall
- เปลี่ยน permission/API key
- เปลี่ยน MCP/API config
- ลบ log/ข้อมูล
- deploy code

หากภายหลังต้องการให้ restart container ได้ ต้องเป็นเฉพาะ container ที่กำหนด, มีเงื่อนไขชัดเจน, มี approval และ audit log

## 12. แผนทำตามลำดับ

### Phase A: ตรวจและยืนยันของเดิม

1. ระบุและเปิด runtime repository ที่ได้รับอนุมัติ เช่น `BrainOS_Platform`
2. ตรวจโครงสร้างจริงและ `API Gateway 01` แบบ read-only โดยไม่แก้ BrainOS foundation
3. ระบุว่า API Gateway 01 มี auth, policy, audit, rate limit, connector และ deployment แล้วหรือยัง
4. เขียน gap analysis ก่อนสร้าง MCP Server 01

### Phase B: ทำฐานความปลอดภัย

1. ทำ AI Data Catalog: ชื่อข้อมูล, ระบบต้นทาง, P0–P3, เจ้าของ, สิทธิ์, Agent ที่ใช้
2. ทำกลุ่มสิทธิ์ตามแผนกผ่าน SSO
3. ปิด direct connection จาก Agent ไป ERP/MSSQL
4. ตั้ง firewall ให้ ERP/MSSQL รับจาก API Gateway/BrainOS Core เท่านั้น

### Phase C: สร้าง MCP Server 01

1. หลังได้รับอนุมัติ MCP Server จึงทำงานเป็น module ภายใต้ `BrainOS_Platform/platform/mcp-server-01`
2. ทำ remote MCP endpoint ที่เชื่อมกับ SSO
3. เพิ่ม Tool 3 ตัวแรก
4. ทุก Tool เรียก API Gateway 01
5. บันทึก audit log แบบ mask P3/ไม่เก็บ P3 ดิบซ้ำใน log

### Phase D: Pilot และขยาย

1. ทดลอง User 2–5 คน
2. ตรวจว่า role/สิทธิ์ถูกต้อง, log ครบ, ความเร็วดี และไม่มีข้อมูลเกินสิทธิ์
3. เปิด Approval Workflow สำหรับ action เสี่ยงก่อนเพิ่ม write tools
4. ค่อยเชื่อม Sales Radar, IT Service Bot และ Lead to Money ตามลำดับ

## 13. การตรวจโปรเจกต์จริง

ผู้ใช้ให้ path บน Mac:

`/Users/dojo/Library/CloudStorage/OneDrive-isuzu-unt.com/Antigarvity/BrainOS`

บันทึกต้นทางระบุว่า environment ของการสนทนาเดิมไม่สามารถเข้าถึง path นี้ได้

การตรวจซ้ำเมื่อ 2026-08-16 เข้าถึง repository BrainOS ได้ และยืนยันว่าไม่พบ `platform/`, `projects/` หรือ `knowledge/` ที่อ้างในข้อเสนอ รวมถึงไม่พบ implementation ของ API Gateway 01 ใน repository นี้

**ขั้นตอนถัดไป:** ระบุตำแหน่ง `BrainOS_Platform` หรือ runtime repository ที่ถูกต้อง แล้วทำ Gap Analysis สำหรับ API Gateway 01 กับ MCP Server 01 แบบ read-only ก่อนเสนอ implementation หรือ deployment ใด ๆ
