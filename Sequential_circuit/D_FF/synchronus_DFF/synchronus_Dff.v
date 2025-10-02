module synchronus_d_ff(
    input wire clk,
    input wire reset,
    input wire data,
    input wire en,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else if (en)
        q <= data;
end

endmodule