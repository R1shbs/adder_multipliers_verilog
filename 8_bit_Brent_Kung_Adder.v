module BrentKungAdder8 (
    input [7:0] A,
    input [7:0] B,
    output [8:0] Sum,
    output Cout
);

    // Internal wires for Brent Kung adder
    wire [7:0] X, Y, Z;
    wire [8:0] P, G;

    // Generate P and G for each bit
    assign X = A ^ B;
    assign Y = A & B;
    assign Z = A | B;
    assign P = Z ^ B;
    assign G = Z & A;

    // Generate Sum
    assign Sum[0] = P[0];
    assign Sum[1:8] = P[1:8] ^ X[1:8];

    // Generate Cout
    assign Cout = G[0] | (G[1] & X[1]) | (G[2] & X[2]) | (G[3] & X[3]) | (G[4] & X[4]) | (G[5] & X[5]) | (G[6] & X[6]) | (G[7] & X[7]) | (G[8] & X[8]);

endmodule
