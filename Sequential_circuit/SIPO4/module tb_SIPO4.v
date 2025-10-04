    module tb_SIPO4();
        reg data;
        reg clk;
        reg reset;
        wire [3:0] q;
        SIPO4 uut(
            .data(data),
            .reset(reset),
            .clk(clk),
            .q(q)
        );
        always #10 clk = ~clk;
        initial begin
            clk = 0;
            reset = 1;
            data = 0;
            #20 reset = 0; 
            #20 data = 1;
            #20 data = 0;
            #20 data = 1;
            #20 data = 1;
            #20 data = 1;

            #20 $finish;
        end
    endmodule
