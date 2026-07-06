**Elevator Controller (4 Floors)**



Services floor requests (0–3) using direction-aware, nearest-floor-first priority, 

similar to a simplified real elevator scheduling algorithm.



**Inputs:** floor\_0\_req, floor\_1\_req, floor\_2\_req, floor\_3\_req, clk, reset

**Outputs:** current\_floor\[1:0], moving\_up, moving\_down, door\_open



States: IDLE, UP, DOWN, DOOR



Each floor request sets a latch that stays pending until serviced. While idle, a 

combinational block picks the nearest pending request based on the current floor 

(priority order differs depending on which floor the elevator is currently at). 

The elevator then moves one floor at a time using an internal counter, opens the 

door on arrival, clears that floor's latch, and automatically checks for any 

remaining pending requests before going idle again.



Two real bugs were found and fixed during simulation:

\- Target floor was being recalculated mid-journey, causing the elevator to abandon 

&#x20; its original destination — fixed by locking the target floor once a journey starts

\- Arrival detection was checking the floor value one cycle too late, wasting an 

&#x20; extra counter cycle per floor — fixed by comparing against the floor value about 

&#x20; to be reached (floor+1 / floor-1) instead of the current one



Simulated using Icarus Verilog + GTKWave.

