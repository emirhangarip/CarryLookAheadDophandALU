module CarryLookAheadAdder4 (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output wire [3:0] Sum,
    output wire Cout,
    output wire Propagate,
    output wire Generate
);
    wire [3:0] G, P; // Generate and Propagate
    wire [3:0] C;    // Carry

    // Generate and Propagate
    assign G = A & B;    // Generate signal
    assign P = A ^ B;    // Propagate signal

    // Carry calculation
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);

    // Sum and carry-out
    assign Sum = P ^ C;
    assign Cout = G[3] | (P[3] & C[3]);

    // Block propagate and generate
    assign Propagate = &P; // All propagate signals are high
    assign Generate = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule
