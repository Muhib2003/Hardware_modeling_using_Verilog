module Chip_Alu(
input [15:0] a,b,
input [3:0] sel,
output [15:0] result,
output reg Carry_out
);

reg [15:0] alu_out;

    wire [15:0] add_out, sub_out;
    wire add_carry, sub_carry;

sixteen_bit_adder add_inst(
    .a(a),
    .b(b),
    .Ci(1'b0),
    .S(add_out),
    .Co(add_carry)
);
sixteen_bit_adder sub_inst(
    .a(a),
    .b(~b+1'b1),
    .Ci(1'b0),
    .S(sub_out),
    .Co(sub_carry)
);


always @(*) begin
    
    alu_out   = 16'b0;
    Carry_out = 1'b0;
    case (sel)
    4'b0000: alu_out = a & b;
    4'b0110: alu_out = a | b;
    4'b0001: alu_out = ~(a | b);
    4'b0010: alu_out = a ^ b;
    4'b0100: alu_out = ~a;
    4'b0101: alu_out = ~(a & b);
    4'b1000: begin
        alu_out = add_out;
        Carry_out = add_carry;
    end
    4'b1001: begin
        alu_out = sub_out;
        Carry_out = sub_carry;
    end
    
    
    endcase
end

assign result=alu_out;
endmodule
