# BCD to 7-Segment Display

This project demonstrates a Verilog implementation of a Binary Coded Decimal (BCD) to 7-segment display decoder.

## Overview

A BCD to 7-segment decoder takes a 4-bit BCD input and generates the corresponding 7-bit output to drive a 7-segment display, allowing decimal digits (0-9) to be shown.

## Features

- Accepts 4-bit BCD input (`0000` to `1001`)
- Outputs 7 control signals for segments (`a` to `g`)
- Displays decimal digits 0-9 on a common cathode 7-segment display




## Example

| BCD Input | 7-Segment Output (`abcdefg`) | Displayed Digit |
|-----------|------------------------------|-----------------|
| 0000      | 1111110                      | 0               |
| 0001      | 0110000                      | 1               |
| ...       | ...                          | ...             |
| 1001      | 1111011                      | 9               |

