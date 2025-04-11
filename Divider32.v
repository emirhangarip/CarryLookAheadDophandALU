// 32-bit Divider (Restore Method)
module Divider32 (
    input [31:0] Dividend,
    input [31:0] Divisor,
    output reg [31:0] Quotient,
    output reg [31:0] Remainder
);
    integer i;
    reg [63:0] TempDividend; // Temporary storage for dividend

    always @(*) begin
        TempDividend = {32'b0, Dividend}; // Initialize with the dividend
        Quotient = 0;

        for (i = 31; i >= 0; i = i - 1) begin
            TempDividend = TempDividend << 1; // Shift left
            TempDividend[0] = Dividend[31 - i];
            if (TempDividend[63:32] >= Divisor) begin
                TempDividend[63:32] = TempDividend[63:32] - Divisor;
                Quotient[i] = 1;
            end
        end
        Remainder = TempDividend[63:32]; // Final remainder
    end
endmodule