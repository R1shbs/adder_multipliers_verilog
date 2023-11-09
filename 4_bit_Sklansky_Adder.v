module SklanskyAdder4 (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Sum,
    output Cout
);

    // Internal wires for Sklansky adder
    wire [3:0] P, G, C;

    // Generate P, G, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = G[0];
    generate
        for (genvar i = 0; i < 3; i = i + 1) begin : gen_pgc
            assign C[i + 1] = G[i + 1] | (P[i] & C[i]);
        end
    endgenerate

    // Generate Sum
    assign Sum[0] = P[0];
    assign Sum[1] = P[1] ^ C[0];
    assign Sum[2] = P[2] ^ C[1];
    assign Sum[3] = P[3] ^ C[2];
    assign Sum[4] = G[3] | (P[3] & C[2]);

    // Output carry
    assign Cout = G[3] | (P[3] & C[2]);

endmodule
