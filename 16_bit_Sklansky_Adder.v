module SklanskyAdder16 (
    input [15:0] A,
    input [15:0] B,
    output [16:0] Sum,
    output Cout
);

    // Internal wires for Sklansky adder
    wire [15:0] P, G, C;

    // Generate P, G, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = G[0];
    generate
        for (genvar i = 0; i < 15; i = i + 1) begin : gen_pgc
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
    assign Sum[8] = P[8] ^ C[7];
    assign Sum[9] = P[9] ^ C[8];
    assign Sum[10] = P[10] ^ C[9];
    assign Sum[11] = P[11] ^ C[10];
    assign Sum[12] = P[12] ^ C[11];
    assign Sum[13] = P[13] ^ C[12];
    assign Sum[14] = P[14] ^ C[13];
    assign Sum[15] = P[15] ^ C[14];
    assign Sum[16] = G[15] | (P[15] & C[14]);

    // Output carry
    assign Cout = G[15] | (P[15] & C[14]);

endmodule
