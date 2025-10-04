module tb_async_DFF;
    reg clk;
    reg reset;
    reg data;
    wire q;
    async_DFF uut(
        .clk(clk),
        .reset(reset),
        .data(data),
        .q(q)
    );
    initial clk=0;
    always #5 clk = ~clk;
    initial begin
        reset = 1;
        data  = 1;
        #10 reset = 0; data = 0;
        #10 data = 1;
        #10 data = 1;
        #10 $finish;
    end
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | data=%b | q=%b", 
                  $time, clk, reset, data, q);
    end
endmodule
