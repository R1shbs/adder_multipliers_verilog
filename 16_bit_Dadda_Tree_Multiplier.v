module DaddaMultiplier16 (
    input [15:0] A,
    input [15:0] B,
    output [31:0] Prod
);

    // Internal wires for partial products
    wire [31:0] P[4:0];

    // Generate partial products
    generate
        for (genvar i = 0; i < 5; i = i + 1) begin : gen_partial_products
            assign P[i] = A[i] & B;
        end
    endgenerate

    // Generate Sum and Cout using Dadda tree algorithm
    wire [62:0] S[30:0], C[30:0];
    assign S[0] = P[0];
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 30; i = i + 1) begin : gen_s_c_arrays
            assign S[i + 1] = P[i + 1] ^ (S[i] & C[i]);
            assign C[i + 1] = P[i + 1] & S[i] | (P[i + 1] & C[i]) | (S[i] & C[i]);
        end
    endgenerate

    // Output the result
    assign Prod = {S[30], S[29:28], S[27:26], S[25:24], S[23:22], S[21:20], S[19:18], S[17:16], S[15:14], S[13:12], S[11:10], S[9:8], S[7], S[6:5], S[4:3], S[2:1]};

endmodule
