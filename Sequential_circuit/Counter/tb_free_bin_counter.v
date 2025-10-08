module tb_free_bin_counter ();

parameter N = 8;

reg clk,reset;
wire [N-1:0] out;
wire max_tick;
free_run_bin_counter uut(
    .clk(clk),
    .reset(reset),
    .out(out),
    .max_tick(max_tick)
);
always #5 clk = ~clk;
initial begin
clk=0;
reset=1;
#10
reset=0;

#50
#20 reset=1;
#10 reset=0;


#20 $finish;
end
endmodule
