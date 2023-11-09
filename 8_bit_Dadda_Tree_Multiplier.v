module DaddaMultiplier8 (
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

    // Generate Sum and Cout using Dadda tree algorithm
    wire [30:0] S[14:0], C[14:0];
    assign S[0] = P[0];
    assign C[0] = 0;
    generate
        for (genvar i = 0; i < 14; i = i + 1) begin : gen_s_c_arrays
            assign S[i + 1] = P[i + 1] ^ (S[i] & C[i]);
            assign C[i + 1] = P[i + 1] & S[i] | (P[i + 1] & C[i]) | (S[i] & C[i]);
        end
    endgenerate

    // Output the result
    assign Prod = {S[14], S[13:12], S[11:10], S[9:8], S[7], S[6:5], S[4:3], S[2:1]};

endmodule
