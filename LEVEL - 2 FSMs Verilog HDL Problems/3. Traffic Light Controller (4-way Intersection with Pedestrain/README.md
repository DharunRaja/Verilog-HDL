**Traffic Light Controller (4-Way Intersection with Pedestrian Crossing)**



Controls traffic lights for two directions (Road 1 and Road 2) plus a pedestrian 

walk signal, using a timed FSM.



**Inputs:** ped\_req, clk, reset

**Outputs:** road\_1\[1:0], road\_2\[1:0] (Red/Yellow/Green), ped\_walk



States: S0 (Road1 Green) → S1 (Road1 Yellow) → S2 (Road2 Green) → S3 (Road2 Yellow) 

→ back to S0, with an inserted S4 (All-Red + Walk) state when a pedestrian request 

is pending.



Each state holds for a fixed number of clock cycles using an internal counter.



Includes a pedestrian request latch (ped\_req\_latch) to fix a real timing bug found 

during simulation: a request pulse arriving mid-cycle was being missed because it 

was only checked at one exact instant. The latch remembers the request until it's 

serviced, then clears.



Simulated using Icarus Verilog + GTKWave.

