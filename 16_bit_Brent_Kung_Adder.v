module BrentKungAdder16 (
    input [15:0] A,
    input [15:0] B,
    output [16:0] Sum,
    output Cout
);

    // Internal wires for Brent Kung adder
    wire [15:0] X, Y, Z;
    wire [16:0] P, G;

    // Generate P and G for each bit
    assign X = A ^ B;
    assign Y = A & B;
    assign Z = A | B;
    assign P = Z ^ B;
    assign G = Z & A;

    // Generate Sum
    assign Sum[0] = P[0];
    assign Sum[1:16] = P[1:16] ^ X[1:16];

    // Generate Cout
    assign Cout = G[0] | (G[1] & X[1]) | (G[2] & X[2]) | (G[3] & X[3]) | (G[4] & X[4]) | (G[5] & X[5]) | (G[6] & X[6]) | (G[7] & X[7]) | (G[8] & X[8]) | (G[9] & X[9]) | (G[10] & X[10]) | (G[11] & X[11]) | (G[12] & X[12]) | (G[13] & X[13]) | (G[14] & X[14]) | (G[15] & X[15]) | (G[16] & X[16]);

endmodule
