module ArrayMultiplier16 (
    input [15:0] A,
    input [15:0] B,
    output [31:0] Prod
);

    // Generate Product using nested loops
    generate
        for (genvar i = 0; i < 16; i = i + 1) begin : gen_mult
            for (genvar j = 0; j < 16; j = j + 1) begin : gen_add
                assign Prod[i + j] = A[i] & B[j];
            end
        end
    endgenerate

endmodule
