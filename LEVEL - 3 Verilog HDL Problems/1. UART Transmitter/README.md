# 

**UART TRANSMITTER (8N1)**



\## Description

This project implements a UART (Universal Asynchronous Receiver Transmitter) Transmitter in Verilog HDL, sending 8-bit data serially using the 8N1 format (8 data bits, no parity, 1 stop bit).



\## Inputs

\* data\_in : 8-bit data to transmit

\* tx\_start : pulse to begin transmission

\* clk : system clock (used internally for bit-period timing, independent of any receiver clock)

\* reset : resets the module



\## Outputs

\* tx : serial output line

\* tx\_busy : HIGH while a transmission is in progress



\## Frame Format

IDLE(1) -> START(0) -> D0 -> D1 -> ... -> D7 -> STOP(1) -> IDLE(1)



\* Data bits are sent LSB first (D0 first, D7 last), per UART convention

\* Each bit is held on the line for a fixed BIT\_PERIOD of clock cycles, simulating a baud-rate-timed transmission



\## Working

Implemented as a 4-state FSM (IDLE, START, DATA, STOP) driven by an internal baud\_counter that times each bit period. A separate bit\_index counter tracks which of the 8 data bits is currently being transmitted, incrementing after each bit period completes.



Verified by decoding the tx line's timing directly from simulation output and confirming it matches the expected LSB-first bit sequence for two different data bytes (0x4A and 0xAA), along with correct tx\_busy assertion/de-assertion at the start and end of each frame.

