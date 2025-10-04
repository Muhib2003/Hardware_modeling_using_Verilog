# # SIPO4 Shift Register (Verilog)

##  Overview
This project implements a **4-bit Serial-In Parallel-Out (SIPO) Shift Register** in Verilog and simulates it using **ModelSim**.  
A SIPO shift register accepts **serial input data** and makes all stored bits available simultaneously as **parallel output**.

---

## Features
- 4-bit SIPO shift register.
- Data is shifted in serially on every rising edge of the clock.
- Asynchronous reset to clear the register.
- Outputs the 4-bit content in parallel.