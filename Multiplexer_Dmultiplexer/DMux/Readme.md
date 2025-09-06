#  (1 to 2) DeMultiplexer
## Overview

DMux.v is a Verilog implementation  for the (1 to 2) DeMultiplexer (DMux), a fundamental digital circuit that takes a single input and delivers it to one of two possible output based on a control signal.It's implements following truth table.

### Truth Table

|in |sel| a | b |   
| 0 | 0 | 0 | 0 |   
| 0 | 1 | 0 | 0 |   
| 1 | 0 | 1 | 0 |   
| 1 | 1 | 0 | 1 |


Here in is the single input and sel is the select bit that directs input to one of two possible output.

