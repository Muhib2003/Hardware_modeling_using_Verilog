module occupancy_counter(
    input clk , reset,
    input inc , dec,
    output reg [7:0] count 

);

always @(posedge clk , posedge reset) begin
    if(reset)
    count <= 0;
    else if(inc)
    count <= count+1;
    else if(dec)
    count <= count-1;

    else
     count <= count;
end

endmodule