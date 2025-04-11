# CLA-Based ALU Design (Verilog)

This project includes an Arithmetic Logic Unit (ALU) designed using Carry Look Ahead Adder (CLA) architecture. The design is written entirely in **SystemVerilog**.

## Main Features

- A **Carry Look Ahead Adder (CLA)** is used for fast and efficient arithmetic operations.
- The **top module** of the project is `ALU.v`.
- A **test bench** is provided to verify functionality.
- In the test bench, the numbers **45** and **23** are used as input operands.

##  Files

| File Name               | Description                              |
|-------------------------|------------------------------------------|
| `ALU.v`                 | Top module – ALU implementation using CLA |
| `CarryLookAheadAdder4.v`| 4-bit CLA module                         |
| `CarryLookAheadAdder32.v`| 32-bit CLA module                      |
| `Divider32.v`           | 32-bit Divider module                    |
| `Multiplier32.v`        | 32-bit Multiplier module                 |
| `ALU_tb.v`              | Test bench for ALU                       |




---

