module ALU (
    input [31:0] A,       // First operand
    input [31:0] B,       // Second operand
    input [3:0] ALUOp,    // ALU operation selector
    output reg [31:0] Result, // Result of the operation
    output Zero,          // Zero flag
    output Overflow       // Overflow flag
);

    wire [31:0] ANDResult, ORResult, XORResult, AddResult, SubResult;
    wire [31:0] MulResult, DivResult, Remainder;
    wire [31:0] SLLResult, SRLResult, SRAResult;
    wire CarryOutAdd, CarryOutSub;
    wire OverflowAdd, OverflowSub;

    // Logical operations
    assign ANDResult = A & B;
    assign ORResult  = A | B;
    assign XORResult = A ^ B;

    // Add/Subtract operations
	CarryLookAheadAdder32 adder (
    .A(A),
    .B(B),
    .Cin(1'b0),
    .Sum(AddResult),
    .Cout(CarryOutAdd),
    .Overflow(OverflowAdd)
	);

	CarryLookAheadAdder32 subtractor (
    .A(A),
    .B(~B),       // Two's complement for subtraction
    .Cin(1'b1),   // Add 1 for two's complement
    .Sum(SubResult),
    .Cout(CarryOutSub),
    .Overflow(OverflowSub)
	);


	// Gate-level multiplication
    Multiplier32 multiplier (
        .A(A),
        .B(B),
        .Product(MulResult)
    );

    // Gate-level division
    Divider32 divider (
        .Dividend(A),
        .Divisor(B),
        .Quotient(DivResult),
        .Remainder(Remainder)
    );

    // Shifts
    assign SLLResult = A << B[4:0];  // Shift left logical
    assign SRLResult = A >> B[4:0]; // Shift right logical
    assign SRAResult = $signed(A) >>> B[4:0]; // Arithmetic shift right

    // Zero flag
    assign Zero = (Result == 32'b0);

    // Overflow flag
    assign Overflow = (ALUOp == 4'b0000) ? OverflowAdd : 
                      (ALUOp == 4'b0001) ? OverflowSub : 1'b0;

    // ALU operation selector
    always @(*) begin
        case (ALUOp)
            4'b0000: Result = AddResult;         // Add
            4'b0001: Result = SubResult;         // Subtract
            4'b0010: Result = MulResult;         // Multiply
            4'b0011: Result = DivResult;         // Divide
            4'b0100: Result = ANDResult;        // AND
            4'b0101: Result = ORResult;         // OR
            4'b0110: Result = XORResult;        // XOR
            4'b0111: Result = SLLResult;        // Shift Left Logical
            4'b1000: Result = SRLResult;        // Shift Right Logical
            4'b1001: Result = SRAResult;        // Arithmetic Shift Right
            default: Result = 32'b0;            // Default
        endcase
    end
endmodule



