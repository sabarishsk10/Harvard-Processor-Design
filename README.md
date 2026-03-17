# 8-bit Harvard Architecture Processor

> A custom-designed processor implemented in Verilog HDL featuring separate instruction and data paths, modular RTL design, and a powerful 8-bit ALU.

---

## Overview

This project demonstrates the design of an 8-bit processor based on Harvard Architecture, where instruction and data memories are physically separated to allow efficient execution.

The processor supports:
- 32-bit instructions
- 32 general-purpose registers
- A feature-rich 8-bit ALU
- Multiple instruction formats and operations

The complete design was developed and verified using the Cadence VLSI toolchain.

---

## Highlights

✔ Harvard Architecture (separate memory units)  
✔ 32-bit instruction format  
✔ 32 × 8-bit register file  
✔ 256-byte data memory  
✔ Modular Verilog implementation  
✔ Supports arithmetic, logic, shift, memory operations  

---

## System Specifications

| Component            | Configuration        |
|---------------------|---------------------|
| Architecture        | Harvard             |
| Instruction Width   | 32-bit              |
| Register File       | 32 × 8-bit          |
| Data Memory         | 256 × 8-bit         |
| Instruction Memory  | 64 × 32-bit         |
| Program Counter     | 6-bit               |
| ALU Size            | 8-bit               |
| Core Type           | Single Core         |

---

## Architecture Blocks

<img width="891" height="548" alt="architecture" src="https://github.com/user-attachments/assets/c72892ca-cbe9-44ac-9ef3-4b87ebda2bf4" />


The processor consists of the following modules:

- Program Counter (PC) – Generates instruction addresses  
- Instruction Memory – Stores program instructions  
- Decoder – Extracts opcode and operands  
- Register File – Stores intermediate data  
- ALU – Performs computation  
- Data Memory – Used for load/store operations  
- Writeback Unit – Updates register file  

---

## Instruction Formats

<img width="709" height="642" alt="instruction_format" src="https://github.com/user-attachments/assets/77af0e6c-aec5-4362-b8a2-5c98b144a2e9" />


Immediate Format:  
Opcode (6) | Rdst (5) | Reserved (13) | Immediate (8)

Register Transfer:  
Opcode (6) | Rdst (5) | Reserved (16) | Rsrc (5)

Load Instruction:  
Opcode (6) | Rdst (5) | Reserved (13) | Address (8)

Store Instruction:  
Opcode (6) | Address (8) | Reserved (13) | Rsrc (5)

Arithmetic / Logic:  
Opcode (6) | Rd2 (5) | Rd1 (5) | Reserved (6) | Rs2 (5) | Rs1 (5)

---

## Instruction Set

<img width="842" height="555" alt="instruction_set" src="https://github.com/user-attachments/assets/b9ab3b69-3cd2-4fa8-84df-23268ce4e927" />


### Data Movement
- MOV Rdst, #Imm
- MOV Rdst, Rsrc
- LOAD
- STORE

### Arithmetic
- ADD
- SUB
- NEG
- MUL
- DIV

### Logical Operations
- OR
- XOR
- NAND
- NOR
- XNOR
- NOT

### Shift Operations
- LLSH (Logical Left Shift)
- LRSH (Logical Right Shift)

---

## ALU Design

The ALU integrates multiple optimized components:

- Carry Lookahead Adder (CLA) – Fast addition and subtraction  
- Wallace Tree Multiplier – High-speed multiplication  
- Logic Unit – Supports AND, OR, XOR, NAND, NOR, XNOR, NOT  
- Barrel Shifter – Performs efficient shift operations  

---

## Project Structure

Harvard-Processor/
├── fetch_unit.v
├── instruction_memory.v
├── decode_unit.v
├── register_file.v
├── alu.v
├── data_memory.v
├── writeback_unit.v
├── harvard_processor.v
└── testbench.v

---

## Module Description

| Module              | Description |
|--------------------|------------|
| fetch_unit         | Generates PC and fetches instruction |
| instruction_memory | Stores instructions |
| decode_unit        | Decodes instruction |
| register_file      | Register bank |
| alu                | Executes operations |
| data_memory        | Handles memory access |
| writeback_unit     | Writes results |
| harvard_processor  | Top-level integration |
| testbench          | Simulation |

---

## Tools Used

- Cadence Genus → Synthesis  
- Cadence Innovus → Physical Design  
- Cadence SimVision → Simulation

---

## Future Enhancements

- Pipeline architecture  
- Hazard detection  
- Branch & jump instructions  
- Interrupt handling  
- Cache integration  
- FPGA deployment  

---

## Author

S Sabarish Kumaran  
ECE Student  

### Interests
- RTL & Digital Design
- FPGA & ASIC Design Flow 
- MIcroprocessors

---
