# ALU.HDL

It's a Verilog implementations of arithmatic logic unit. 

## Overview

The ALU is a key component in any computer system, responsible for performing arithmetic and logic operations. This   ALU  computes results based on control bits and two 16-bit inputs.


 ### Functionality

The ALU takes in:

Two 16-bit inputs: a and b
4-bit select input: [3:0] sel
#### Operation
Based on the select signal Alu computes some logical and arithmatical operation.
Logical: And,Or,Nand,Nor,Xor,not.
Arithmatical: Addition, Subtraction.

these operation produces 16- bit result with proper carry out handling.


 



