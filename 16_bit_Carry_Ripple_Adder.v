module CarryRippleAdder16 (
    input [15:0] A,
    input [15:0] B,
    output [16:0] Sum,
    output Cout
);

    // Internal wire for carry propagation
    wire [16:0] Carry;

    // Full adder instances for each bit
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_full_adder
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
    assign Cout = Carry[16];

endmodule
