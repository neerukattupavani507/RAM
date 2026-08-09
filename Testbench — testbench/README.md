# RAM Design Using Verilog HDL

## 📌 Project Overview

This project implements a single-port Random Access Memory (RAM)
using Verilog HDL.

The RAM has 16 memory locations, with each location capable of
storing 8 bits of data.

The design supports both write and read operations using a common
clock signal.

---

## 🎯 Objectives

- Understand the working principle of RAM
- Design a single-port RAM using Verilog HDL
- Implement read and write operations
- Verify the RAM using a testbench
- Generate simulation waveforms
- Analyze the read and write operations
- Upload the complete project to GitHub

---

## 🧠 What is RAM?

RAM stands for Random Access Memory.

RAM is a memory device in which data can be stored and retrieved
from any memory location using its address.

Unlike ROM, RAM allows data to be written and changed during
normal operation.

---

## ⚙️ Design Specifications

| Parameter | Value |
|-----------|-------|
| Memory Type | Single-Port RAM |
| Number of Locations | 16 |
| Data Width | 8 bits |
| Address Width | 4 bits |
| Total Capacity | 128 bits |
| HDL | Verilog |
| Clock | Positive Edge |
| Read/Write | Synchronous |

---

## 🔌 Input Signals

### `clk`

Clock signal used for read and write operations.

### `we`

Write Enable signal.

```text
we = 1 → Write
we = 0 → Read