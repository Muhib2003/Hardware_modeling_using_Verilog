module mux2to1 (out,in0,in1,sel);
output out;
input in0,in1;
input sel;
wire sn;
wire y0,y1;

not(sn,sel);
and(y0,in0,sn);
and(y1,in1,sel);
or(out,y0,y1);

endmodule