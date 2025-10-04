
module tb_sync_Dff();
reg clk;
reg reset,data,en;
wire q;
synchronus_d_ff uut(
    .clk(clk),
    .reset(reset),
    .data(data),
    .en(en),
    .q(q)
);
always #5 clk= ~clk;
initial begin
    clk=0;
    reset=1;
    en=0;
    data=1;

    #10;
    reset=0;
    en=0;
    data=1;

    #10;
    reset=0;
    en=1;
    data=1;
  #10 $finish;
end
endmodule