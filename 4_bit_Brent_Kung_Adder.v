module BrentKungAdder4 (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Sum,
    output Cout
);

    // Internal wires for Brent Kung adder
    wire [3:0] X, Y, Z;
    wire [4:0] P, G;

    // Generate P and G for each bit
    assign X = A ^ B;
    assign Y = A & B;
    assign Z = A | B;
    assign P = Z ^ B;
    assign G = Z & A;

    // Generate Sum
    assign Sum[0] = P[0];
    assign Sum[1:4] = P[1:4] ^ X[1:4];

    // Generate Cout
    assign Cout = G[0] | (G[1] & X[1]) | (G[2] & X[2]) | (G[3] & X[3]) | (G[4] & X[4]);

endmodule
