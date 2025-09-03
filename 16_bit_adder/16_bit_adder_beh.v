module sixteen_bit_adder(S, Co, a, b, Ci);

output reg [15:0] S;
output reg Co;

input [15:0] a, b;
input Ci;

always @ (*)
begin
	{Co, S} = a + b + Ci;
end

endmodule