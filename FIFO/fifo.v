module fifo #(
parameter B = 8,
parameter w=4)
(
input wire clk,reset,
input wire rd , wr,
input wire [B-1:0] w_data,
output wire full,empty,
output wire [B-1:0] r_data
);
reg[B-1:0] mem[2**w-1:0];

reg[w-1:0] w_ptr_reg,w_ptr_next,w_ptr_succ;
reg[w-1:0] r_ptr_reg,r_ptr_next,r_ptr_succ;

reg full_reg,empty_reg,full_next,empty_next;

wire wr_en;
    assign r_data=mem[r_ptr_reg];
    assign wr_en = wr & ~full_reg;
    
always @(posedge clk) begin
    if(wr_en)
    mem[w_ptr_reg] <=w_data;
end


always @(posedge clk or posedge reset) begin

    if(reset)begin
    w_ptr_reg <=0;
    r_ptr_reg <=0;
    full_reg <= 1'b0;
    empty_reg <= 1'b1;
    end

    else
    begin
    w_ptr_reg <= w_ptr_next;
    r_ptr_reg <= r_ptr_next;
    full_reg <= full_next;
    empty_reg <= empty_next;
    end
end

always @(*) begin
    //successive pointer logic
w_ptr_succ = w_ptr_reg+1;
r_ptr_succ = r_ptr_reg+1;
// default values
w_ptr_next= w_ptr_reg;
r_ptr_next=r_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;

case({wr,rd})
//read operation

2'b01:
if(~empty_reg)begin
r_ptr_next = r_ptr_succ;
full_next = 1'b0;
if(r_ptr_succ == w_ptr_reg)
empty_next=1'b1;
end

//write operation
2'b10:
if(~full_reg)
begin
w_ptr_next=w_ptr_succ;
empty_next=1'b0;
if(w_ptr_succ == r_ptr_reg)
full_next=1'b1;

end
2'b11:
if(~full_reg & ~empty_reg)begin

    w_ptr_next = w_ptr_succ;
    r_ptr_next = r_ptr_succ;
end

endcase
end
assign full=full_reg;
assign empty=empty_reg;

endmodule