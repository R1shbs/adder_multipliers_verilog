module CarryRippleAdder (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Sum,
    output Cout
);

    // Internal wire for carry propagation
    wire [4:0] Carry;

    // Full adder instances for each bit
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_full_adder
            full_adder fa (
                .A(A[i]),
                .B(B[i]),
                .Cin(Carry[i]),
                .Sum(Sum[i]),
                .Cout(Carry[i + 1])
            );
        end
    endgenerate

    // Output carry
    assign Cout = Carry[4];

endmodule

// Full Adder module (assumed to be in a separate file or part of your design)
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    // Implementation details of the full adder
    // ...

endmodule
