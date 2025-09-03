`timescale 1ns/1ps
module tb_mux2to1;

  // Testbench signals
  reg in0, in1, sel;
  wire out;

  // Instantiate the DUT (Device Under Test)
  mux2to1 uut (
    .out(out),
    .in0(in0),
    .in1(in1),
    .sel(sel)
  );

  // Stimulus
  initial begin
    // Display header
    $display("Time | sel in0 in1 | out");
    $monitor("%4t |  %b    %b   %b  |  %b", $time, sel, in0, in1, out);

    // Test vectors
    sel=0; in0=0; in1=0; #10;  // Expect out=0
    sel=0; in0=1; in1=0; #10;  // Expect out=1
    sel=0; in0=0; in1=1; #10;  // Expect out=0
    sel=1; in0=0; in1=1; #10;  // Expect out=1
    sel=1; in0=1; in1=0; #10;  // Expect out=0
    sel=1; in0=1; in1=1; #10;  // Expect out=1

    #20 $stop; // End simulation
  end
endmodule
