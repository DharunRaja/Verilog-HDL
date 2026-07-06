**Synchronous FIFO (8-deep, 8-bit wide)**



First-In-First-Out queue implemented as a circular buffer with read and write pointers.



**Inputs:** clk, reset, wr\_en, rd\_en, data\_in\[7:0]

**Outputs:** data\_out\[7:0], full, empty



Uses 4-bit read/write pointers (one extra bit beyond what's needed to address 8 

locations) to distinguish between FULL and EMPTY conditions:

\- empty = pointers equal, including the extra bit

\- full = lower 3 bits of pointers match, but the extra bit differs (write pointer 

&#x20; has lapped the read pointer once)



Simulated using Icarus Verilog + GTKWave.

