    module debouncing_circuit(
    input wire clk , reset,
    input wire sw,
    output reg db
    );

    localparam[2:0]

    zero = 3'b000,
    wait1_1 = 3'b001,
    wait1_2 = 3'b010,
    wait1_3 = 3'b011,
    One = 3'b100,
    wait0_4 = 3'b101,
    wait0_5 = 3'b110,
    wait0_6 = 3'b111;

    localparam N = 19;

    reg [N-1:0] q_next , q_reg;
    wire m_tick;
    reg [2:0] state_reg , state_next;

    always @(posedge clk , posedge reset) begin
        if(reset)
        q_reg <= 0;
        else
        q_reg <= q_next;
        
    end

    assign q_next = q_reg+1;
    assign m_tick = (q_reg  == 0) ? 1'b1 : 1'b0;

    always @(posedge clk or posedge reset) begin

    if(reset)
    state_reg <= zero;
    else
    state_reg <= state_next;
    end
    always @(*) begin

    state_next = state_reg;
    db = 1'b0;

    case(state_reg)
    zero:begin
    if(sw)
    state_next = wait1_1;
    end
    
    wait1_1:begin
        if(~sw)
        state_next = zero;
        else
        if(m_tick)
        state_next = wait1_2;
    end

    wait1_2:begin
            if(~sw)
            state_next = zero;
            else
            if(m_tick)
            state_next = wait1_3;
    end
    wait1_3:begin
            if(~sw)
            state_next = zero;
            else
            if(m_tick)
            state_next = One;
    end

    One:begin
        db = 1'b1;
        if(~sw)
        state_next = wait0_4;
    end
    wait0_4:begin
            db = 1'b1;     
            if(sw)
            state_next = One;
            else
            if(m_tick)
            state_next = wait0_5;
        
    end
    wait0_5: begin
            db = 1'b1;
            if(sw)
            state_next = One;
            else
            if(m_tick)
            state_next = wait0_6;
    end 
    wait0_6: begin
            db = 1'b1;
            if(sw)
            state_next = One;
            else
            if(m_tick)
            state_next = zero;
    end
    default: state_next = zero;
    
    endcase
    
    end

    endmodule