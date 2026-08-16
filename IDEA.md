# BrainOS Idea Backlog

**Document Status:** Draft

**Owner:** BrainOS Owner

**Last Updated:** 2026-08-16

## Purpose

รวบรวมแนวคิดที่อาจพัฒนาเป็นมาตรฐานการกำกับดูแลหรือองค์ความรู้ของ BrainOS เพื่อให้ตรวจสอบ คัดกรอง และเชื่อมโยงไปยังเอกสารต้นทางได้อย่างเป็นระบบ

รายการในเอกสารนี้เป็นแนวคิดระหว่างพิจารณา ไม่ใช่นโยบาย สถาปัตยกรรมที่อนุมัติแล้ว หรือคำสั่งให้พัฒนา runtime

## Current Ideas

- ศึกษาแนวทางกำกับ AI Data Control, API Gateway, MCP Server, สิทธิ์แบบ least privilege, audit log และ human approval จากบันทึกต้นทาง [BrainOS — AI Data Control, API Gateway และ MCP Server](01_Knowledge/03_Sources/BRAINOS_AI_DATA_CONTROL_GATEWAY_CHAT_HISTORY_2026-08-12.md)

## Repository Boundary

- BrainOS เก็บเฉพาะ governance และ curated knowledge
- runtime application, API Gateway, MCP Server และ production services ต้องอยู่ใน `BrainOS_Platform` หรือโปรเจกต์ runtime ที่ได้รับอนุมัติ
- local model serving ต้องอยู่ใน `Micro_LLM`
- แนวคิดทุกข้อยังต้องผ่านการตรวจข้อเท็จจริง ความเสี่ยง เจ้าของ และ change control ก่อนเลื่อนสถานะ
