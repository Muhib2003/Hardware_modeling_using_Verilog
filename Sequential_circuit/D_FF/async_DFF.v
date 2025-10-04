module async_DFF(
    input clk,reset,data,
    output reg q
);
always @ (posedge clk or posedge reset)begin
if(reset)
q <= 1'b0;
else
q <= data;
end
endmodule
