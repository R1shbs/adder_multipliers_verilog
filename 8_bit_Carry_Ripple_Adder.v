module CarryRippleAdder8 (
    input [7:0] A,
    input [7:0] B,
    output [8:0] Sum,
    output Cout
);

    // Internal wire for carry propagation
    wire [8:0] Carry;

    // Full adder instances for each bit
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_full_adder
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
    assign Cout = Carry[8];

endmodule
