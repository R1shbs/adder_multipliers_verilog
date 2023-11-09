module WallaceTreeMultiplier8 (
    input [7:0] A,
    input [7:0] B,
    output [15:0] Prod
);

    // Internal wires for partial products
    wire [15:0] P[3:0];

    // Generate partial products
    generate
        for (genvar i = 0; i < 4; i = i + 1) begin : gen_partial_products
            assign P[i] = A[i] & B;
        end
    endgenerate

    // Generate S and C arrays for each stage
    wire [15:0] S[3:0], C[3:0];
    assign S[0] = P[0];
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 3; i = i + 1) begin : gen_s_c_arrays
            assign S[i + 1] = P[i + 1] ^ (S[i] & C[i]);
            assign C[i + 1] = P[i + 1] & S[i] | (P[i + 1] & C[i]) | (S[i] & C[i]);
        end
    endgenerate

    // Generate Sum and Cout using S and C arrays
    generate
        for (genvar i = 0; i < 4; i = i + 1) begin : gen_sum_cout
            assign Prod[i] = S[i];
        end
    endgenerate

endmodule
