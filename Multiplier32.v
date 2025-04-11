// 32-bit Multiplier (Shift-and-Add Algorithm)
module Multiplier32 (
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Product
);
    integer i;
    reg [63:0] TempProduct; // Temporary product to hold intermediate results

    always @(*) begin
        TempProduct = 0;
        for (i = 0; i < 32; i = i + 1) begin
            if (B[i]) // Check if the ith bit of the multiplier is set
                TempProduct = TempProduct + (A << i); // Add shifted multiplicand
        end
        Product = TempProduct[31:0]; // Assign the lower 32 bits to the output
    end
endmodule

