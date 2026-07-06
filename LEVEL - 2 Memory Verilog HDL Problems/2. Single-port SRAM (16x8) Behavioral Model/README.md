**Single-port SRAM (16x8)**



Behavioral model of a simple memory block with 16 addressable locations, 8 bits wide.



**Inputs:** clk, reset, cs (chip select), we (write enable), addr\[3:0], data\_in\[7:0]

**Output:** data\_out\[7:0]



Operation:

\- cs=1, we=1 → writes data\_in to memory\[addr]

\- cs=1, we=0 → reads memory\[addr] into data\_out

\- cs=0 → SRAM disabled, no read or write occurs



Simulated using Icarus Verilog + GTKWave.

