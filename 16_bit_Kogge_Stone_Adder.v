module KoggeStoneAdder16 (
    input [15:0] A,
    input [15:0] B,
    output [16:0] Sum,
    output Cout
);

    // Internal wires for Kogge Stone adder
    wire [15:0] P, G, O, C;

    // Generate P, G, O, and C for each bit
    assign P = A ^ B;
    assign G = A & B;
    assign O = A | B;
    assign C[0] = G[0];
    generate
        for (genvar i = 0; i < 15; i = i + 1) begin : gen_pgc
            assign G[i + 1] = (G[i] & O[i]) | (P[i] & G[i]) | (P[i] & O[i]);
            assign C[i + 1] = G[i + 1] | (C[i] & O[i]);
        end
    endgenerate

    // Generate Sum
    assign Sum = A + B + C[1:0];

    // Output carry
    assign Cout = C[15];

endmodule
