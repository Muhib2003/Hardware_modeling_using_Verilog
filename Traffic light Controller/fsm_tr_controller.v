module fsm_traffic_controller(
    input wire clk, reset,
    input wire T1, T2,
    output reg[1:0] LA,
    output reg[1:0] LB
);
localparam [1:0]
s0 = 2'b00,
s1 = 2'b01,
s2 = 2'b10,
s3 = 2'b11;
localparam [1:0]
    RED    = 2'b00,
    YELLOW = 2'b01,
    GREEN  = 2'b10;

reg[1:0] state_reg,state_next;
always @(posedge clk, posedge reset) begin

    if(reset)
    state_reg <= s0;
    else
    state_reg <= state_next;
    
end

always @(*) begin
    state_next = state_reg ;
    case(state_reg)
s0:begin
if(T1)
state_next = s0;
else
state_next = s1;
end
s1:begin
state_next = s2;
end
s2: begin
if(T2)
state_next = s2;
else
state_next= s3;
end
s3: begin
state_next = s0;
end

endcase

end

always @(*) begin
    case (state_reg)
        s0: begin LA = GREEN;  LB = RED;    end
        s1: begin LA = YELLOW; LB = RED;    end
        s2: begin LA = RED;    LB = GREEN;  end
        s3: begin LA = RED;    LB = YELLOW; end
        default: begin LA = RED; LB = RED;  end
    endcase
end

endmodule