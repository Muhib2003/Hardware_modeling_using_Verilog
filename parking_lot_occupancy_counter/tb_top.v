`timescale 1ns/1ps
module tb_top;
reg clk , reset;
reg a , b;
wire [7:0] count;
wire [3:0] an;
wire[6:0] sseg ;

top top_instance(
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .count(count),
    .an(an),
    .sseg(sseg)
);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    reset = 1;
    a = 0;
    b = 0;
    #10 reset = 0;
    #10 a = 1; // Car enters
    #10 a = 0; // Car stops entering
    #20 b = 1; // Car exits
    #10 b = 0; // Car stops exiting
    #20 a = 1; // Another car enters
    #10 a = 0; // Car stops entering
    #20 b = 1; // Another car exits
    #10 b = 0; // Car stops exiting
    #50 $finish;

end
initial begin
$display("Time\tclk\treset\ta\tb\tcount\tan\tsseg");
$monitor("%0t\t%b\t%b\t%b\t%b\t%h\t%h\t%h", $time, clk, reset, a, b, count, an, sseg);

end

endmodule