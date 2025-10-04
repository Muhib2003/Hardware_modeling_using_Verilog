

module D_FF(
    input clk,data,
    output reg q
    
);
always @(posedge clk) begin
q<=data;
end
endmodule