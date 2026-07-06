**Dual-Port RAM with Collision Detection**



Memory block with two independent access ports (A and B), each with its own address, 

data, and write-enable signals, both operating on the same clock edge.



**Inputs:** addr\_a\[3:0], addr\_b\[3:0], data\_in\_a\[7:0], data\_in\_b\[7:0], we\_a, we\_b, clk

**Outputs:** data\_out\_a\[7:0], data\_out\_b\[7:0], collision



A collision is flagged when both ports access the same address in the same cycle 

and at least one of them is writing:

collision = (addr\_a == addr\_b) \&\& (we\_a || we\_b)



Reads to the same address from both ports are allowed and do not trigger a collision, 

since no data conflict occurs when neither side is writing.



Simulated using Icarus Verilog + GTKWave.

