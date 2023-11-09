module BoothMultiplier16 (
    input signed [15:0] A,
    input signed [15:0] B,
    output signed [31:0] Prod
);

    reg signed [31:0] result;

    always @* begin
        result = A * B;
    end

    assign Prod = result;

endmodule
