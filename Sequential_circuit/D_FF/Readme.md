# D Flip-Flop with Enable (D_FF_EN)

This project demonstrates the implementation of a synchronous D Flip-Flop with enable signal using Verilog.

## Overview

A D Flip-Flop with enable (`en`) captures the value of the data input (`Data`) on the rising edge of the clock (`CLK`) only when the enable signal is high. The output (`Q`) updates to the input value if enabled; otherwise, it retains its previous state.

## Features

- Verilog implementation of synchronous D Flip-Flop with enable
- Testbench for simulation
- Simple and reusable module
- Enable-controlled data storage
