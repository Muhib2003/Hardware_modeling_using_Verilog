module tb_univ_counter () ;
    parameter N = 8;
    reg reset, clk;
    reg load, up, en, sync_clr;
    reg [N-1:0] d;
    wire max_tick, min_tick;   
    wire [N-1:0] q;         

    univ_bin_counter uut (
        .reset(reset),
        .clk(clk),
        .load(load),
        .up(up),
        .en(en),
        .sync_clr(sync_clr),
        .d(d),
        .max_tick(max_tick),
        .min_tick(min_tick),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        up = 1;

        en = 0;
        sync_clr = 0;
        d = 8'b00111111;

        #10 reset = 0;

        #10 en = 1; sync_clr = 1;
        #10 sync_clr = 0;

        #20 up = 0;
        #20 en = 0;

        #20 load = 1;
        #10 load = 0;

	#20 load = 1; d=8'b11111111;
        #50;   
        #20 reset = 1;
        #10 reset = 0;
        #20 $stop;
    end
    initial begin
        $monitor("time=%0d reset=%b load=%b up=%b en=%b sync_clr=%b d=%b max_tick=%b min_tick=%b q=%b", 
                 $time, reset, load, up, en, sync_clr, d, max_tick, min_tick, q);
    end

endmodule
