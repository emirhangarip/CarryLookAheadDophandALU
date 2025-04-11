module CarryLookAheadAdder32 (
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output wire [31:0] Sum,
    output wire Cout,
    output wire Overflow
);
    wire [7:0] C;           // Carry signals between 4-bit adders
    wire [7:0] P, G;        // Propagate and Generate from each block

    // Instantiate eight 4-bit CLA blocks
    CarryLookAheadAdder4 cla0 (.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .Sum(Sum[3:0]), .Cout(C[0]), .Propagate(P[0]), .Generate(G[0]));
    CarryLookAheadAdder4 cla1 (.A(A[7:4]), .B(B[7:4]), .Cin(C[0]), .Sum(Sum[7:4]), .Cout(C[1]), .Propagate(P[1]), .Generate(G[1]));
    CarryLookAheadAdder4 cla2 (.A(A[11:8]), .B(B[11:8]), .Cin(C[1]), .Sum(Sum[11:8]), .Cout(C[2]), .Propagate(P[2]), .Generate(G[2]));
    CarryLookAheadAdder4 cla3 (.A(A[15:12]), .B(B[15:12]), .Cin(C[2]), .Sum(Sum[15:12]), .Cout(C[3]), .Propagate(P[3]), .Generate(G[3]));
    CarryLookAheadAdder4 cla4 (.A(A[19:16]), .B(B[19:16]), .Cin(C[3]), .Sum(Sum[19:16]), .Cout(C[4]), .Propagate(P[4]), .Generate(G[4]));
    CarryLookAheadAdder4 cla5 (.A(A[23:20]), .B(B[23:20]), .Cin(C[4]), .Sum(Sum[23:20]), .Cout(C[5]), .Propagate(P[5]), .Generate(G[5]));
    CarryLookAheadAdder4 cla6 (.A(A[27:24]), .B(B[27:24]), .Cin(C[5]), .Sum(Sum[27:24]), .Cout(C[6]), .Propagate(P[6]), .Generate(G[6]));
    CarryLookAheadAdder4 cla7 (.A(A[31:28]), .B(B[31:28]), .Cin(C[6]), .Sum(Sum[31:28]), .Cout(C[7]), .Propagate(P[7]), .Generate(G[7]));

    // Final carry-out
    assign Cout = C[7];

    // Overflow detection (for signed addition)
    assign Overflow = (A[31] & B[31] & ~Sum[31]) | (~A[31] & ~B[31] & Sum[31]);
endmodule
