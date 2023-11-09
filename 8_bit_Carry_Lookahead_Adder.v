module CarryLookaheadAdder8 (
    input [7:0] A,
    input [7:0] B,
    output [8:0] Sum,
    output Cout
);

    // Internal wires for carry lookahead
    wire [8:0] P, G, C;

    // Generate P, G, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 8; i = i + 1) begin : gen_pgc
            assign C[i + 1] = (G[i] | (P[i] & C[i]));
        end
    endgenerate

    // Generate Sum
    assign Sum = A + B + C[1:0];

    // Output carry
    assign Cout = C[8];

endmodule
