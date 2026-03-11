module mux(
    input [7:0] adder, sub, bitOr,bitXor,
    input [1:0] mode,
    output [7:0] out
);

wire [7:0] and1;
wire [7:0] and2;
wire [7:0] and3;
wire [7:0] and4;
wire [7:0] or1;
wire [7:0] or2;

assign and1 = adder&{8{mode == 2'b11}}; //11 for adding 2 numbers, and sign-extend mode for operation.
assign and2 = sub&{8{mode == 2'b01}};// 01 for subtracting 2 numbers
assign and3 = bitOr&{8{mode == 2'b10}};//10 for bit-wize or
assign and4 = bitXor&{8{mode == 2'b00}};//00 for bit-wize xor

assign or1 = and1|and2;
assign or2 = and3|and4;

assign out = or1|or2;
endmodule
