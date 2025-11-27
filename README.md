🖥️ Single-Cycle RISC-V Processor (RV32I)

This repository contains a fully functional Single-Cycle RISC-V Processor supporting the RV32I instruction set.
The design is written in Verilog HDL, with clean modular blocks and a well-structured datapath, making it ideal for learning, academic projects, and RTL design practice.

🌟 What is a Single-Cycle Processor?

In a single-cycle CPU, every instruction completes in exactly one clock cycle.
All five fundamental stages of instruction execution are completed within the same cycle:

Instruction Fetch (IF)
Instruction Decode (ID)
Execute (EX)
Memory Access (MEM)
Write-Back (WB)

This makes the architecture simple, easy to debug, and perfect for beginners.

✔ No pipeline
✔ No hazards
✔ No forwarding logic
✔ One cycle per instruction

