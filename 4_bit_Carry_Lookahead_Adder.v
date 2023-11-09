module CarryLookaheadAdder4 (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Sum,
    output Cout
);

    // Internal wires for carry lookahead
    wire [4:0] P, G, C;

    // Generate P, G, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 4; i = i + 1) begin : gen_pgc
            assign C[i + 1] = (G[i] | (P[i] & C[i]));
        end
    endgenerate

    // Generate Sum
    assign Sum = A + B + C[1:0];

    // Output carry
    assign Cout = C[4];

endmodule
