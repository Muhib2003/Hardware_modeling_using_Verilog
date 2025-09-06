module tb_And16();
reg [15:0] a,b;
wire [15:0] out;
And16 uut(.a(a),.b(b),.out(out));
initial begin 
    $display("Time | a      b      | out");
    $monitor("%0t | %h %h | %h", $time, a, b, out);
    a = 16'hFFFF; b = 16'h0000; #10;
    a = 16'h1234; b = 16'h5678; #10;
    a = 16'hABCD; b = 16'hEF01; #10;
    a = 16'h0000; b = 16'h0000; #10;
    a = 16'hFFFF; b = 16'hFFFF; #10;
    $finish;
  end
endmodule