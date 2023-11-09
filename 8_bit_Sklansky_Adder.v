module SklanskyAdder8 (
    input [7:0] A,
    input [7:0] B,
    output [8:0] Sum,
    output Cout
);

    // Internal wires for Sklansky adder
    wire [7:0] P, G, C;

    // Generate P, G, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = G[0];
    generate
        for (genvar i = 0; i < 7; i = i + 1) begin : gen_pgc
            assign C[i + 1] = G[i + 1] | (P[i] & C[i]);
        end
    endgenerate

    // Generate Sum
    assign Sum[0] = P[0];
    assign Sum[1] = P[1] ^ C[0];
    assign Sum[2] = P[2] ^ C[1];
    assign Sum[3] = P[3] ^ C[2];
    assign Sum[4] = P[4] ^ C[3];
    assign Sum[5] = P[5] ^ C[4];
    assign Sum[6] = P[6] ^ C[5];
    assign Sum[7] = P[7] ^ C[6];
    assign Sum[8] = G[7] | (P[7] & C[6]);

    // Output carry
    assign Cout = G[7] | (P[7] & C[6]);

endmodule
