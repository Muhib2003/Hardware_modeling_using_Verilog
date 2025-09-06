module DMux1to2 (out0,out1,in,sel);
output out0,out1;
input in;
input sel;
wire sn;
wire y0, y1;
not(sn, sel);
and(y0, in, sn);
and(y1, in, sel);

assign out0 = y0;
assign out1 = y1;

    
endmodule