`timescale 1ns/1ps

module ALU_tb;
    reg [31:0] A, B;          // Inputs ALU
    reg [3:0] ALUOp;          // Operation selector
    wire [31:0] Result;       // ALU output
    wire Zero, Overflow;      // Flags

    
    ALU uut (
        .A(A),
        .B(B),
        .ALUOp(ALUOp),
        .Result(Result),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    initial begin
        // Test 1 Addition 
        A = 45;   
        B = 23;  
        ALUOp = 4'b0000;  
        #1;  
        $display("Addition: A=%b, B=%b, Result=%b", A, B, Result);

        // Test 2 Subtraction 
        
        A = 45;
        B = 23;
        ALUOp = 4'b0001;  
        #1;  
        $display("Subtraction: A=%b, B=%b, Result=%b", A, B, Result);

        // Test 3 AND 
        
        A = 45;
        B = 23;
        ALUOp = 4'b0100;  
        #1;  
        $display("AND: A=%b, B=%b, Result=%b", A, B, Result);

        // Test 4 OR 
        
        A = 45;
        B = 23;
        ALUOp = 4'b0101;  
        #1;  // Wait 1 ns
        $display("OR: A=%b, B=%b, Result=%b", A, B, Result);

        // Test 5: Shift Left Logical (SLL)
        
        A = 45;  
        B = 2;   
        ALUOp = 4'b0111;  
        #1;  // Wait 1 ns
        $display("Shift Left Logical (SLL): A=%b, B=%b, Result=%b", A, B, Result);

        // Test 6 (SRL)
        
        A = 45;  
        B = 2;   
        ALUOp = 4'b1000;  
        #1;  // Wait 1 ns
        $display("Shift Right Logical (SRL): A=%b, B=%b, Result=%b", A, B, Result);

        // Test 7 (ASR)
        
        A = -45; 
        B = 2;   
        ALUOp = 4'b1001;  
        #1;  
        $display("Arithmetic Shift Right (ASR): A=%b, B=%b, Result=%b", A, B, Result);
         // Test 8 XOR emirhan
         A=45;
         B=23;
         ALUOp=4'b0110;
         #1;
        $display("XOR: A=%b, B=%b, Result=%b", A, B, Result);
         // Test 9 Multýply
         A=45;
         B=23;
         ALUOp=4'b0010;
         #1;
         $display("Multýplying: A=%b, B=%b, Result=%b", A, B, Result);
         //TEST 10 DIVSION
         A=45;
         B=23;
         ALUOp=4'b0011;
         #1;
       $display("DIVISION: A=%b, B=%b, Result=%b", A, B, Result);

        $stop;
    end
endmodule
