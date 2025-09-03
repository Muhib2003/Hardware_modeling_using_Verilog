`timescale 1ns/1ps

module tb_Adder16();
  reg  [15:0] a, b;
  reg         Ci;
  wire [15:0] S;
  wire        Co;

  sixteen_bit_adder uut (.a(a), .b(b), .Ci(Ci), .S(S), .Co(Co));

  initial begin
    $display("Time | a      b      ci | s      co");
    
    $monitor("time=%0t | a=%h b=%h ci=%b | s=%h co=%b",
    $time, a, b, Ci, S, Co);

    a=16'd10; b=16'd6; Ci=0; #10;
    a=16'd10; b=16'd6; Ci=1; #10;
    a=16'd200; b=16'd100; Ci=0; #10;
    a=16'hFFFF; b=16'd1; Ci=0; #10; // overflow test

    $finish;
  end

endmodule
