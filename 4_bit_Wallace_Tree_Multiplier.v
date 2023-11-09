module WallaceTreeMultiplier4 (
    input [3:0] A,
    input [3:0] B,
    output [7:0] Prod
);

    // Internal wires for partial products
    wire [7:0] P[2:0];

    // Generate partial products
    generate
        for (genvar i = 0; i < 3; i = i + 1) begin : gen_partial_products
            assign P[i] = A[i] & B;
        end
    endgenerate

    // Generate S and C arrays for each stage
    wire [7:0] S[2:0], C[2:0];
    assign S[0] = P[0];
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 2; i = i + 1) begin : gen_s_c_arrays
            assign S[i + 1] = P[i + 1] ^ (S[i] & C[i]);
            assign C[i + 1] = P[i + 1] & S[i] | (P[i + 1] & C[i]) | (S[i] & C[i]);
        end
    endgenerate

    // Generate Sum and Cout using S and C arrays
    generate
        for (genvar i = 0; i < 3; i = i + 1) begin : gen_sum_cout
            assign Prod[i] = S[i];
        end
    endgenerate

endmodule
