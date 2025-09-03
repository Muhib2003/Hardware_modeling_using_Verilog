`timescale 1ns/1ps
module tb_Alu();
reg [15:0] a,b;
reg [3:0] sel;
wire Carry_out;
wire [15:0] result;
Chip_Alu uut(
    .a(a),
    .b(b),
    .sel(sel),
    .Carry_out(Carry_out),
    .result(result)
);

    initial begin
    $display("Time | a |   b   | sel | result | Carry_out ");
    $monitor("%4t | %d | %d | %b | %d | %b", $time, a, b, sel, result, Carry_out);

        a=16'd10; b=16'd6; sel=4'b0000; #10;
        a=16'd10; b=16'd6; sel=4'b0001; #10;
        a=16'd200; b=16'd100; sel=4'b0010; #10;
        a=16'hFFFF; b=16'd1; sel=4'b0011; #10; // overflow test

    $finish;

    end
    endmodule