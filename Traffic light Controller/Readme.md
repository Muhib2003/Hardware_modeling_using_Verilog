
# FSM-Based Traffic Light Controller using Verilog 
## Overview
This project implements a Moore Finite State Machine (FSM) based traffic light controller using Verilog . The controller manages traffic flow between two intersecting roads (Road A and Road B) by sequencing green, yellow, and red signals in a safe and deterministic manner.

### FSM Description

The controller consists of four states, each representing a unique traffic light configuration:

    State	Road A Light	Road B Light
    S0 (Reset)	Green	        Red
    S1	        Yellow	        Red
    S2	        Red	            Green
    S3	        Red	            Yellow

The system starts in State S0 after reset.

State transitions are controlled by traffic sensor signals T_A and T_B.

As a Moore FSM, the output signals depend only on the current state.
### state transition

`•`	→S0 – If the sensor TA shows empty the next state will be S1.Else we will stay in S0.          

`•`→S1 –  when in state S1, the system will always move to S2.

`•`→S2 – If the sensor TB shows empty  the the next state     will be S3 ,else we will stay in S2.

`•`	→S3 – when in state S3, the system will always move to S0.

### Tools & Technologies

Verilog HDL

ModelSim (Simulation)

FSM (Moore Machine) Design Methodology

***Referance***
1. P. P. Chu, FPGA Prototyping by Verilog Examples. Hoboken, NJ, USA: Wiley, 2008.
2. D. M. Harris and S. L. Harris, Digital Design and Computer Architecture, 1st ed. San
Francisco, CA, USA: Morgan Kaufmann, 2007.