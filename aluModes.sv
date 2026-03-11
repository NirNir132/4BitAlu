//ALU modes- Add, Subtract and bit-wize xor/or

module bitWizeXor(
    input [7:0] A,B,
    output [7:0] s
);
    assign s = A^B;

endmodule

module bitWizeOr(
    input [7:0] A,B,
    output [7:0] s
);
    assign s = A|B;

endmodule

module add(
    input [7:0] A,B,
    output [7:0] sum,
    output cOutAdd
);

wire out[7:0];
wire c[8:0];
assign c[0] = 0;

//during this i've discoverd this option to generate, just creating the ripple carry adder nicer.
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : ripple_carry_loop
        fullAdder bit_adder(
            .a(A[i]),
            .b(B[i]),
            .cIn(c[i]),
            .s(sum[i]), 
            .cOut(c[i+1])
        );
    end
endgenerate

assign cOutAdd = c[8];
    
endmodule

module sub(
    input [7:0] A,B,
    output [7:0] s,
    output cOut
);
wire [7:0] invertB;
assign invertB = ~B + 8'b1;
//based on 2's compliment- just adding A + (-B)
    add sub(
        .A(A),
        .B(invertB),//invert bits
        .sum(s),
        .cOutAdd(cOut)    
    );

endmodule
