                module parking_lot(
                    input wire clk , reset,
                    input wire  a ,b,
                    output reg enter , exit
                );
                localparam[2:0] 
                s0 = 3'b000,
                E1 = 3'b001,
                E2 = 3'b010,
                E3 = 3'b011,
                X1 = 3'b100,
                X2 = 3'b101,
                X3 = 3'b110;

                reg[2:0] state_reg , state_next;

                always @(posedge clk or posedge reset) begin

                    if(reset)
                    state_reg <= s0;

                    else
                    state_reg <= state_next;
                    
                end
                
                always @(*) begin
                    
                    state_next = state_reg;
                    enter = 1'b0;
                    exit = 1'b0;
                

                case(state_reg)

                s0:begin
                    if(a && ! b)
                    state_next = E1;
                    else if(!a && b)
                    state_next = X1;
                end
                // Car is Entering
                E1:begin
                    if(a && b)
                    state_next = E2;
                    else if(!a && !b)
                    state_next = s0;
                end
                E2:begin
                    if(!a && b)
                    state_next = E3;
                    else if(a && !b)
                    state_next = E1;
                end
                E3:begin
                    if(!a && !b)begin
                    state_next = s0;
                    enter = 1'b1;end          // Car entered
                 
                    else if( a && b)
                    state_next = E2;
                end

                // Car is started to leaving
                X1:begin
                    if(a && b)
                    state_next = X2;
                    else if(!a && !b)
                    state_next = s0;
                
                end
                X2: begin
                    if(a && !b)
                    state_next = X3;
                    else if(!a && b)
                    state_next = X1;
                end
                X3:begin
                    if(!a && !b)begin
                    state_next = s0;
                    exit = 1'b1;
                    end
                    else if(a && b)
                    state_next = X2;
                end
                endcase
                end
                endmodule