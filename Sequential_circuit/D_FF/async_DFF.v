module async_DFF(
    input wire clk;
    input wire reset;
    input wire data;
    output reg q;

);

always @ (posedge clk or posedge reset)begin
if(reset==1)
q <= 1'b0;
else
q <= data;

end
endmodule