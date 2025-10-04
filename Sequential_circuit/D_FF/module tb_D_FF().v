module tb_D_FF();

reg clk;
reg d;
wire q;


D_FF uut (
    .clk(clk),
    .data(d),
    .q(q)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    d = 0;
    #12 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    #10
 $finish;
 
end



endmodule
