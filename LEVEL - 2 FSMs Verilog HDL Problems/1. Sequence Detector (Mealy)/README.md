**Sequence Detector — Overlapping "1011" (Mealy Machine)**



Detects the pattern "1011" in a serial bit stream, one bit per clock cycle, 

including overlapping occurrences.



**Inputs:** din, clk, reset

**Output:** dout (goes high for one cycle when the pattern is detected)



Implemented as a Mealy machine with 4 states (S0–S3) representing how much of the 

pattern has been matched so far. Output depends on both current state and current 

input, allowing immediate response instead of waiting for a state transition.



Since it's overlapping, detecting "1011" doesn't reset back to S0 — the trailing 

"1" is reused as the start of a possible next match.



Uses a standard 2-always-block FSM structure: one sequential block for the state 

register, one combinational block for next-state and output logic.



Simulated using Icarus Verilog + GTKWave.

