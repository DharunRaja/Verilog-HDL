**Vending Machine FSM**



Accepts ₹5 and ₹10 coins and dispenses an item once ₹15 or more has been inserted, 

returning change if overpaid.



**Inputs:** coin\_5, coin\_10, clk, reset

**Outputs:** dispense, change



States: S0 (₹0), S5 (₹5), S10 (₹10)



Transitions:

\- S0 + coin5 → S5, S0 + coin10 → S10

\- S5 + coin5 → S10, S5 + coin10 → S0 (dispense, exact amount)

\- S10 + coin5 → S0 (dispense, exact amount)

\- S10 + coin10 → S0 (dispense + change, overpaid by ₹5)



Implemented as a Moore-style FSM with outputs registered directly within each 

state transition.



Simulated using Icarus Verilog + GTKWave.

