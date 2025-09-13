module bcd_to_sseg(
    input [3:0] bcd,
    
    output reg[6:0] sseg
);
always @(*)begin
    case(bcd)
4'b0000: sseg[6:0] = 7'b1111110;
4'b0001: sseg[6:0] = 7'b0110000;
4'b0010: sseg[6:0] = 7'b1101101;
4'b0011: sseg[6:0] = 7'b1111001;
4'b0100: sseg[6:0] = 7'b0110011;
4'b0101: sseg[6:0] = 7'b1011011;
4'b0110: sseg[6:0] = 7'b1011111;
4'b0111: sseg[6:0] = 7'b1110000;
4'b1000: sseg[6:0] = 7'b1111111;
4'b1001: sseg[6:0] = 7'b1111011;
default:sseg[6:0] = 7'b0000000;

    endcase

end
endmodule