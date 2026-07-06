**8-bit ALU (8 Operations)**



**Description**

This project implements an 8-bit Arithmetic Logic Unit (ALU) in Verilog HDL. The ALU performs eight different arithmetic and logical operations based on a 3-bit control signal using a case statement.



**Inputs**

\* A : 8-bit input operand

\* B : 8-bit input operand

\* ALU\_SEL : 3-bit control signal that selects the operation to be performed



**Outputs**

\* ALU\_OUT : 8-bit output result

\* CARRY : 1-bit carry/borrow output



**Internal Signal**

\* zero : 1-bit wire that becomes HIGH whenever ALU\_OUT is equal to 8'b00000000.



**ALU Operations**



**Case 0 – Addition**

Performs the addition of inputs A and B.

\* If the result exceeds 8 bits, the lower 8 bits are stored in ALU\_OUT.

\* The overflow bit is stored in CARRY.



**Case 1 – Subtraction**

Performs A − B.

\* If CARRY = 0, it indicates A ≥ B, and the subtraction result is positive (no borrow).

\* If CARRY = 1, it indicates A < B, producing a negative result. The magnitude is represented using 2's complement and stored in ALU\_OUT (borrow occurred).



**Case 2 – AND**

Performs the bitwise AND operation between A and B.



**Case 3 – OR**

Performs the bitwise OR operation between A and B.



**Case 4 – XOR**

Performs the bitwise XOR operation between A and B.



**Case 5 – NOT**

Performs the bitwise NOT operation on input A.



**Case 6 – SHIFT LEFT**

Shifts input A left by one bit.



**Case 7 – SHIFT RIGHT**

Shifts input A right by one bit.



**Default Case**

Sets ALU\_OUT to 8'b00000000`.

