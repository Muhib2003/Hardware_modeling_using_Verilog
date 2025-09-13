module tb_sseg();

reg [3:0] bcd;

wire [6:0] sseg;

bcd_to_sseg uut(
    .bcd(bcd),
    
    .sseg(sseg)
);
initial begin
$display(" Time | bcd |  sseg ");
$monitor("%4t | %b | %b ",$time ,bcd,sseg);

 bcd = 4'b0000;
#10 bcd = 4'b0001;
#10 bcd = 4'b0010;
#10 bcd = 4'b0011;
#10 bcd = 4'b0100;
#10 bcd = 4'b0101;
#10 bcd = 4'b0110;
#10 bcd = 4'b0111;
#10 bcd = 4'b1000;
#10 bcd = 4'b1001;
#10 $finish;
    end

endmodule
