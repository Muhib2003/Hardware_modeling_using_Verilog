module top(
    input wire clk , reset,
    input wire a , b,
    output wire [7:0] count,
    output wire [3:0] an,
    output wire [6:0] sseg
);
wire enter,exit;
wire sw0, sw1;

parking_lot fsm_instances(
    .clk(clk),
    .reset(reset),
    .a(sw0),
    .b(sw1),
    .enter(enter),
    .exit(exit)
);
occupancy_counter counter_instances(
    .clk(clk),
    .reset(reset),
    .inc(enter),
    .dec(exit),
    .count(count)
);
debouncing_circuit db_1(
    .clk(clk),
    .reset(reset),
    .sw(a),
    .db(sw0)
);
debouncing_circuit db_2(
    .clk(clk),
    .reset(reset),
    .sw(b),
    .db(sw1)
);
hex_multiplexing hex_instances(
    .clk(clk),
    .reset(reset),
    .hex3(count[7:4]),
    .hex2(count[3:0]),
    .hex1(4'b0000),
    .hex0(4'b0000),
    .dp_in(4'b0000),
    .an(an),
    .sseg(sseg)
);

endmodule