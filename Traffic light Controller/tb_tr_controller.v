module tb_tr_controller;

reg clk, reset;
reg T1, T2;
wire [1:0] LA, LB;

fsm_traffic_controller uut (
    .clk(clk),
    .reset(reset),
    .T1(T1),
    .T2(T2),
    .LA(LA),
    .LB(LB)
);

always #5 clk = ~clk;

initial begin

  clk = 0;
  reset=1;
  T1=1;
  T2=0;

#10 
reset=0;
#10

T1=0; //transition from s0 to s1

#10 //s1 pass it to s2

T2 = 0;//transition from s2 to s3

#10//s3 pass it to s0

T1=1;
T2=1;

#10 $finish;

end

initial begin
    $monitor("Time=%0t | LA=%b | LB=%b | T1=%b | T2=%b",
              $time, LA, LB, T1, T2);
           
end

endmodule
