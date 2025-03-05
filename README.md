# Basic_memory_module_verilog
A simple synchronous memory module with testbench
# Memory Module

## Overview
The `memory` module is a simple synchronous memory unit supporting read and write operations. It handles 16 memory locations with an 8-bit data width.

## Design Specification

### Module Name
**memory**

### Inputs and Outputs

| Signal   | Direction | Width  | Description |
|----------|----------|--------|-------------|
| `clk`    | Input    | 1-bit  | Positive edge-triggered clock signal |
| `reset`  | Input    | 1-bit  | Active-high synchronous reset |
| `wr_en`  | Input    | 1-bit  | Write enable (`1` writes `data_in` into memory) |
| `rd_en`  | Input    | 1-bit  | Read enable (`1` reads `data_out` from memory) |
| `addr`   | Input    | 4-bit  | Address input (16 memory locations) |
| `data_in`| Input    | 8-bit  | Data input written to memory |
| `data_out` | Output | 8-bit  | Data output read from memory |

### Memory Specifications
- **Memory Size:** `16 x 8-bit` (16 locations, each storing 8-bit data)
- **Address Range:** `0 to 15` (4-bit addressing)
- **Read/Write Operations:**
  - If `wr_en = 1`, `data_in` is written to `mem[addr]`.
  - If `rd_en = 1`, `data_out` is read from `mem[addr]`.
  - If both `wr_en` and `rd_en` are active in the same cycle, write occurs first.

## Functional Behavior
1. **Reset (`reset = 1`)**:
   - Clears memory contents.
   - Outputs are set to zero or undefined.
2. **Write Operation (`wr_en = 1`, `rd_en = 0`)**:
   - Writes `data_in` to `mem[addr]`.
3. **Read Operation (`rd_en = 1`, `wr_en = 0`)**:
   - Reads stored value from `mem[addr]` into `data_out`.
4. **Simultaneous Read/Write (`wr_en = 1`, `rd_en = 1`)**:
   - Memory writes first, then outputs the new value.
     
## **edaplayground link**
https://www.edaplayground.com/x/jbSr

## **simulation output**
![image](https://github.com/user-attachments/assets/50baf428-36bc-4349-a83c-8292101b6bc5)

## **wave form**
![image](https://github.com/user-attachments/assets/37c04089-8e1d-4ef7-9e37-26213e9f0f42)



