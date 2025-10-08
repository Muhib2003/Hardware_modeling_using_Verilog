# Verilog Binary Counters (Free-Running & Universal)

This file contains two parameterized binary counter designs in Verilog:

- **Free-Running Binary Counter** → simple counter that continuously increments.  
- **Universal Binary Counter** → versatile counter with up/down control, load, enable, and synchronous clear.

---

##  Features
- Parameterizable bit-width (`N`, default = 8).  
- **Free-Running Counter**:
  - Increments automatically on every clock cycle.
  - Asynchronous reset.
  - `max_tick` pulses high when counter = all 1s.  
- **Universal Counter**:
  - Up/Down counting (`up` = 1 → count up, `up` = 0 → count down).  
  - Load external data (`d`) into counter when `load=1`.  
  - Enable control (`en`) to pause/resume counting.  
  - Synchronous clear (`sync_clr`) to reset counter to 0 on next clock edge.  
  - `max_tick` (all 1s) and `min_tick` (all 0s) indicators.  


