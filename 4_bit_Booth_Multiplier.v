module BoothMultiplier4 (
    input signed [3:0] A,
    input signed [3:0] B,
    output signed [7:0] Prod
);

    reg signed [7:0] result;

    always @* begin
        result = A * B;
    end

    assign Prod = result;

endmodule
