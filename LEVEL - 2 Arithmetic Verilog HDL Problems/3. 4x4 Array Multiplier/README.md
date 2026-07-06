**4x4 Array Multiplier**



**Multiplies two 4-bit unsigned numbers to produce an 8-bit product using structural design.**



**Inputs: A\[3:0], B\[3:0]**

**Output: P\[7:0]**



**Built using:**

**- 16 AND gates to generate partial products (A\[i] \& B\[j])**

**- Full Adder instances arranged in 3 rows to sum the shifted partial products, similar to manual long multiplication**



**Demonstrates array-based multiplier architecture, a foundational structure used in ALUs and DSP blocks.**



**Verified against expected products for various A, B combinations.**

