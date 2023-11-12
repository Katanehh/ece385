module CLA4 ( // 4 bit CLA
	input   [3:0]  A, B,
	input          c, 
	output [3:0]   S,
	output         PGn, GGn
	
);

   logic c1, c2, c3;
   full_adder CAR0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]));
   full_adder CAR1(.x(A[1]), .y(B[1]), .z(c1), .s(S[1]));
   full_adder CAR2(.x(A[2]), .y(B[2]), .z(c2), .s(S[2]));
   full_adder CAR3(.x(A[3]), .y(B[3]), .z(c3), .s(S[3]));
   
    logic [3:0] P, G;
   // assign G = A & B;
   // assign P = A ^ B;
   
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
       
   
    //assign S = S[3];
    
endmodule


/* module LookaheadCarryUnit ( // 16 bit lookahead carry unit
	input         PGn, GGn,
	input         cin,
	output        G16,P16, // G and P for the 16th bit addition
	output        cout,
	output        c
);
   
    logic c4, c8, c12, PG0, PG4, PG8, PG12, GG0, GG4, GG8, GG12;
  // call from CLA4 to get PG0, GG0, etc to do the following logic
    assign c4 = GG0 | (cin & PG0);
    assign c8 = GG4 | (GG0 & PG4) | (cin & PG0 & PG4);
    assign c12 = GG8 | (GG4 & PG8) | (GG0 & PG8) | (cin & PG8 & PG4 & PG0);
    assign cout = GG12 | (GG8 & PG12) | (GG4 & PG12) | (GG0 & PG12) | (cin & PG12 & PG8 & PG4 & PG0);
    
endmodule

*/

module lookahead_adder ( // connects the four blocks of 4-bit CLAs and the 16-bit LookaheadCarry unit to create 16-bit lookahead adder
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
    logic [3:0] G ;
    logic [3:0] P ;
    logic [3:0] PGG;
    logic [3:0] GGG;
    logic cc1, cc2, cc3;
    
    assign cc1 = GGG[0] | (cin & PGG[0]);
    assign cc2 = GGG[1] | (GGG[0] & PGG[1]) | (cin & PGG[0] & PGG[1]);
    assign cc3 = GGG[2] | (GGG[1] & PGG[2]) | (GGG[0] & PGG[2]) | (cin & PGG[2] & PGG[1] & PGG[0]);
    assign cout = GGG[3] | (GGG[2] & PGG[4]) | (GGG[1] & PGG[4]) | (GGG[0] & PGG[4]) | (cin & PGG[4] & PGG[2] & PGG[1] & PGG[0]);
    
    CLA4 cla0 (.A(A[3:0]), .B(B[3:0]), .Cin(cin), .S(S[3:0]), .PGn(PGG[0]), .GG(GGG[0]));
    CLA4 cla1 (.A(A[7:4]), .B(B[7:4]), .Cin(cc1), .S(S[7:4]), .PGn(PGG[1]), .GG(GGG[1]));
    CLA4 cla2 (.A(A[11:8]), .B(B[11:8]), .Cin(cc2), .S(S[11:8]), .PGn(PGG[2]), .GG(GGG[2]));
    CLA4 cla3 (.A(A[15:12]), .B(B[15:12]), .Cin(cc3), .S(S[15:12]), .PGn(PGG[3]), .GG(GGG[3]));

   // LookaheadCarryUnit lu (.P(Cout4), .G(Cout), .cin(c0), .G16(G16), .P16(P16), .c(iDONTKNOW));

endmodule