//fulladder implementation- see more in sketches attached
module fullAdder(
    input a,b,cIn,
    output s,cOut
);

assign s = a^b^cIn;
assign cOut = a&b|cIn&(a^b);
endmodule
