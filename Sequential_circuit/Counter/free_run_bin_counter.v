module free_run_bin_counter
#(parameter N = 8 )
(
    input clk,reset,
    output wire [N-1:0] out,
    output wire max_tick

);
reg [N-1:0] r_reg;
wire [N-1:0] r_next;

always @(posedge clk or posedge reset) begin
if(reset)
r_reg <= 0;
else 
r_reg <= r_next;
end
assign r_next=r_reg+1;

assign out =r_reg;

assign max_tick =(r_reg == {N{1'b1}});
endmodule