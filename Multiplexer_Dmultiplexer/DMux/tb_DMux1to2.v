`timescale 1ns / 1ps

module tb_DMux1to2;

    // Inputs
    reg din;
    reg sel;

    // Outputs
    wire dout0;
    wire dout1;

    // Instantiate the Unit Under Test (UUT)
    DMux1to2 uut (
        .din(din),
        .sel(sel),
        .dout0(dout0),
        .dout1(dout1)
    );

    initial begin
        // Initialize Inputs
        din = 0; sel = 0;
        #10;

        // Test case 1: din=0, sel=0
        din = 0; sel = 0;
        #10;

        // Test case 2: din=1, sel=0
        din = 1; sel = 0;
        #10;

        // Test case 3: din=0, sel=1
        din = 0; sel = 1;
        #10;

        // Test case 4: din=1, sel=1
        din = 1; sel = 1;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0d din=%b sel=%b -> dout0=%b dout1=%b", $time, din, sel, dout0, dout1);
    end

endmodule