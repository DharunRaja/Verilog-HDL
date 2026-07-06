**16-bit Carry Lookahead Adder**



**Adds two 16-bit numbers using the Carry Lookahead method instead of a ripple carry —**

**calculates all carries in advance using Generate (G) and Propagate (P) logic,**

**so it's faster than a ripple carry adder since it doesn't wait for carry to ripple**

**through each bit one by one.**



**INPUT: A\[15:0], B\[15:0], Cin (1-bit)**

**OUTPUT: SUM\[15:0], COUT (1-bit)**



**Generate (G) = A AND B → a carry is generated regardless of incoming carry**

**Propagate (P) = A XOR B → an incoming carry gets passed through**



**Each bit's carry is calculated using G and P terms instead of waiting for the**

**previous bit's actual carry output, which removes the ripple delay.**



**Simulated using Icarus Verilog and verified against manual binary addition**

**for multiple test cases including overflow (carry out = 1).**

