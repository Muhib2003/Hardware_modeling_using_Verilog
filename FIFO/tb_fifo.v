    module tb_fifo();
    
    parameter B=8;
    parameter w=4;
    reg clk,reset;
    reg rd,wr;
    reg [B-1:0] w_data;
    wire full,empty;
    wire [B-1:0] r_data;
    fifo uut(
        .clk(clk),.reset(reset),
        .rd(rd),.wr(wr),.w_data(w_data),.full(full),
        .empty(empty),.r_data(r_data)
    );

        always #5 clk=~clk;
        initial begin
                    clk = 0;
                    reset = 1;
                    wr = 0;
                    rd = 0;
                    w_data = 0;

                    #10 reset =0;

                    $display("\n ---writing data---");
                     wr = 1;  w_data = 10;  #10;
                     wr = 1;  w_data = 20;  #10;
                     wr = 1;  w_data = 30;  #10;
                     wr = 0;

                       $display("\n--- Reading Data ---");

                    rd = 1;  #10;  $display("Read = %0d", r_data);
                    rd = 1;  #10;  $display("Read = %0d", r_data);
                    rd = 1;  #10;  $display("Read = %0d", r_data);
                    rd = 0;

                    #20;
        $stop;
        end
    endmodule

