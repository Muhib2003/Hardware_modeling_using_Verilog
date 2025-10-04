module SISO4(
input clk,reset,data,
output reg q
);
reg[3:0] shift_reg;
always @(posedge clk or posedge reset) begin
    if(reset)
        shift_reg <= 4'b0000;
    else
        shift_reg <= {shift_reg[2:0] , data}; 
    q <= shift_reg[3];
end
endmodule