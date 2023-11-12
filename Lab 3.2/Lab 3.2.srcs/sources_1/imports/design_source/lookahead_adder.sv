module CLA4 ( // 4 bit CLA
	input   [3:0]  A, B,
	input          cin, 
	output [3:0]   S,
	output         PGn, GGn
	
);

   logic c1, c2, c3;
   full_adder CAR0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]));
   full_adder CAR1(.x(A[1]), .y(B[1]), .z(c1), .s(S[1]));
   full_adder CAR2(.x(A[2]), .y(B[2]), .z(c2), .s(S[2]));
   full_adder CAR3(.x(A[3]), .y(B[3]), .z(c3), .s(S[3]));
   
    logic [3:0] P, G;
   
    assign c1 = (cin &P[0])||G[0];
    assign c2 = (cin&P[0]&P[1])||(G[0]&P[1])||G[1];
    assign c3 = (cin&P[0]&P[1])&P[2]||(G[0]&P[1]&P[2])||(G[1]&P[2])|| G[2];
    
    always_comb 
    begin
        P = A ^ B;
        G = A & B;
        end
        
assign PGn = P[0] & P[1] & P[2] & P[3];
assign GGn = G[3] || (G[2]&P[3])||(G[1]&P[3]&P[2])||(G[0]&P[3]&P[2]&P[1]);
    
endmodule

module full_adder 
(
    input logic x, y, z,
    output logic s, c 
);
    assign s = x^y^z;
    assign c = (x&y)|(y&z)|(x&z);
endmodule

module lookahead_adder ( // connects the four blocks of 4-bit CLAs and the 16-bit LookaheadCarry unit to create 16-bit lookahead adder
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    logic [3:0] G ;
    logic [3:0] P ;
    logic [3:0] PGG;
    logic [3:0] GGG;
    logic cc1, cc2, cc3;
    
    assign cc1 = GGG[0] | (cin & PGG[0]);
    assign cc2 = GGG[1] | (GGG[0] & PGG[1]) | (cin & PGG[0] & PGG[1]);
    assign cc3 = GGG[2] | (GGG[1] & PGG[2]) | (GGG[0] & PGG[2]) | (cin & PGG[2] & PGG[1] & PGG[0]);
    assign cout = GGG[3] | (GGG[2] & PGG[4]) | (GGG[1] & PGG[4]) | (GGG[0] & PGG[4]) | (cin & PGG[4] & PGG[2] & PGG[1] & PGG[0]);
    
    CLA4 cla0 (.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .PGn(PGG[0]), .GGn(GGG[0]));
    CLA4 cla1 (.A(A[7:4]), .B(B[7:4]), .cin(cc1), .S(S[7:4]), .PGn(PGG[1]), .GGn(GGG[1]));
    CLA4 cla2 (.A(A[11:8]), .B(B[11:8]), .cin(cc2), .S(S[11:8]), .PGn(PGG[2]), .GGn(GGG[2]));
    CLA4 cla3 (.A(A[15:12]), .B(B[15:12]), .cin(cc3), .S(S[15:12]), .PGn(PGG[3]), .GGn(GGG[3]));

endmodule