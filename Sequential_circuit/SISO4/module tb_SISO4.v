module tb_SISO4();
reg clk;
reg reset;
reg data;

wire q;

SISO4 uut(
    .clk(clk),
    .reset(reset),
    .data(data),
    .q(q)
);
always #5 clk=~clk;
initial begin

clk=0;
reset=1;
data=1;

#10
clk=1;
reset=0;
data=1;

#10
clk=0;
reset=0;
data=1;

#10
clk=1;
reset=0;
data=1;

$finish;

end

endmodule

