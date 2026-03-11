// Main ALU

module alu(
    input [7:0] A,B,
    input [1:0] aluOp,
    output [7:0] res,
    output overFlow
);
//in this version of ALU I decided to compute all the modes and select by mode which output to set as result.

wire [7:0] addRes;
wire [7:0] subRes;
wire [7:0] xorRes;
wire [7:0] orRes;
wire overFlowSub;
wire overFlowAdd;

add additon(
    .A(A),
    .B(B),
    .sum(addRes),
    .cOutAdd(overFlowAdd)
);
sub subtract(
    .A(A),
    .B(B),
    .s(subRes),
    .cOut(overFlowSub)
);
bitWizeOr orr(
    .A(A),
    .B(B),
    .s(orRes)
);
bitWizeXor xorr(
    .A(A),
    .B(B),
    .s(xorRes)
);
//attach all the functions outputs to mux input
mux multiplexer(
    .adder(addRes),
    .sub(subRes),
    .bitOr(orRes),
    .bitXor(xorRes),
    .mode(aluOp),
    .out(res)
);

endmodule
