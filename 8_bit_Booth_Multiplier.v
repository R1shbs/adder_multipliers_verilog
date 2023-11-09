module BoothMultiplier8 (
    input signed [7:0] A,
    input signed [7:0] B,
    output signed [15:0] Prod
);

    reg signed [15:0] result;

    always @* begin
        result = A * B;
    end

    assign Prod = result;

endmodule
