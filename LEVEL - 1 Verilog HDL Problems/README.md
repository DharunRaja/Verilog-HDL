# Verilog Projects

RTL Design practice problems built using Icarus Verilog and GTKWave.

Tools: Icarus Verilog | GTKWave | VS Code  
Language: Verilog HDL

---

## Level 1 — Basics

### 1. Full Adder + 4-bit Ripple Carry Adder
- 1-bit Full Adder using gate primitives (structural)
- 4 Full Adder instances chained to build 4-bit RCA
- Carry ripples from bit 0 to bit 3

### 2. 8-bit Barrel Shifter
- Shifts 8-bit input left or right by 0–7 positions
- Built using 2x1 MUX instances (structural)
- DIR=0 for left shift, DIR=1 for right shift

### 3. Priority Encoder 8-to-3
- Encodes 8-line input to 3-bit binary output
- Highest active input gets priority
- Implemented using casex with don't care conditions

### 4. D Flip Flop with Sync Reset + Enable
- Triggered on positive clock edge
- Synchronous reset sets Q to 0
- Enable controls whether D is captured

### 5. 4-bit Universal Shift Register
- 4 modes: Hold, Shift Right, Shift Left, Parallel Load
- Mode selected by 2-bit control signal
- Uses concatenation operator for clean shift logic

### 6. BCD to 7-Segment Display Decoder
- Converts 4-bit BCD input (0–9) to 7-segment output
- Output bits map to segments a–g
- Invalid inputs (10–15) default to all segments off
