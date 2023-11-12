/* module ripple_adder4
(
    input  [3:0] A, B,

    input         cin, // cin is equivalent to c0
    output [3:0] S,
    output        cout
);
// Logic for the CRA 

   logic c1, c2, c3, c4;
   full_adder CAR0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(c1));
   full_adder CAR1(.x(A[1]), .y(B[1]), .z(c1), .s(S[1]), .c(c2));
   full_adder CAR2(.x(A[2]), .y(B[2]), .z(c2), .s(S[2]), .c(c3));
   full_adder CAR3(.x(A[3]), .y(B[3]), .z(c3), .s(S[3]), .c(c4));

     TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
  /*  assign cout = c4;

endmodule

module mux
(
    input [3:0] SA,
    input [3:0] SB,
    input c, // c acts as a select bit
    Output [3:0] S
);

    assign S = c ? SB : SA; // if c is 1 then S = SB, otherwise S = SA
    
endmodule 

module select_adder (
	input  [15:0] A, B,
	input         cin,
	input  [3:0] select,
	output [15:0] S,
	output        cout
);

    logic [3:0] cc, co, S0, S1, S2, S3, S4, S5, S6, S7;
    
   ripple_adder4 RA0 (.A(S0), .B(S4), .cin(cin), .select(S[0]), .cout(cc[0]));
   ripple_adder4 RA1 (.A(S1), .B(S5), .cin(cc[0]), .select(S[4]), .cout(co[0]));
   ripple_adder4 RA2 (.A(S2), .B(S6), .cin(cc[0]), .select(S[8]), .cout(co[1]));
   ripple_adder4 RA3 (.A(S3), .B(S7), .cin(cc[1]), .select(S[12]), .cout(co[2]));

   // Select the output based on S
   mux M0 (.SA(select[0]), .SB(select[4]), .c(S[0]), .S(select[0:3]));
   mux M1 (.SA(select[1]), .SB(select[5]), .c(S[1]), .S(select[4:7]));
   mux M2 (.SA(select[2]), .SB(select[6]), .c(S[2]), .S(select[8:11]));
   mux M3 (.SA(select[3]), .SB(select[7]), .c(S[3]), .S(select[12:15]));

   // Carry-out of the select adder
   assign cout = co[2];

endmodule */

/*module full_adder 
(
    input logic x, y, z,
    output logic s, c 
);
    assign s = x^y^z;
    assign c = (x&y)|(y&z)|(x&z);
endmodule*/

module ripple_adder4
(
    input [3:0] A, B,
    input cin,
    output [3:0] S,
    output c0
);

   logic c1, c2, c3, c4;
   assign cin =0;
   full_adder CAR0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(c1));
   full_adder CAR1(.x(A[1]), .y(B[1]), .z(c1), .s(S[1]), .c(c2));
   full_adder CAR2(.x(A[2]), .y(B[2]), .z(c2), .s(S[2]), .c(c3));
   full_adder CAR3(.x(A[3]), .y(B[3]), .z(c3), .s(S[3]), .c(c4));

   assign c0 = c4; // could also just use c0 in the full_adder CAR3
endmodule


module four_bitCSA
(
    input  [3:0] A, B,
    input        cin1, cin2,
    output [3:0] S1,
    output [3:0] S2,
    output [3:0] SF,
    output Zero,
    output One
);

//rippleaddefr (....... .c0(zero)
//rippl)adder )... .c0(one)
//gatesn .cin(c4) ).one(one)
//ri[p
    logic zero, one;
    assign cin1 = 0; // is cin1 and cin2 an input or just logic?? ah I think it's redundant.. damn that wasted a lot of lines in the 16 bit module
    assign cin2 = 1;
    ripple_adder4 RA0(.A(A[3:0]), .B(B[3:0]), .cin(cin1), .S(S1[3:0]), .c0(zero));
    ripple_adder4 RA1(.A(A[3:0]), .B(B[3:0]), .cin(cin2), .S(S2[3:0]), .c0(one));

    assign Zero = zero;
    assign One = one;
    
endmodule

module mux
(
    input c0,
    input [3:0] S1,
    input [3:0] S2,
    output [3:0] SF  
    
);
    

    assign SF [3:0] = c0 ? S1[3:0] : S2[3:0]; // if c0 is 1 then S = zero, otherwise S = one
    
endmodule

module gates
(
    input c0,
    input Zero,
    input One,
    output gate2
);
    logic gate1;
    assign gate1 = c0 & One;
    assign gate2 = gate1 || Zero;

endmodule

module select_adder // 16 bit overall module
(
    input [15:0]  A, B, 
    input cin,
    output [15:0] SF,
    output CoutF
    
);
    logic c4, c8, c12, COUT, ZERO, ONE; // COUT pay attention and pay attention to how i use Sone and Stwo [3:0]
    logic [3:0] Sone0, Stwo0;
    logic [3:0] Sone1, Stwo1;
    logic [3:0] Sone2, Stwo2;
    logic c40, c41, c80, c81, c120, c121;
    assign cin = 0;
    assign ZERO = 1'b0;
    assign ONE = 1'b1;
    
    ripple_adder4 RAF(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(SF[3:0]), .c0(c4)); // First 4-bit ripple adder with cin = 0
    
    four_bitCSA CSA0(.A(A[7:4]), .B(B[7:4]), .cin1(ZERO), .cin2(ONE), .S1(Sone0[3:0]), .S2(Stwo0[3:0]), .Zero(c40), .One(c41)); // 4 bit adder [7:4]
    mux MUX0(.c0(c4), .S1(Sone0[3:0]), .S2(Stwo0[3:0]), .SF(SF[7:4])); // 8 bits already done
    gates GATE0(.c0(c4), .Zero(c40), .One(c41), .gate2(c8)); // so now c8 contains gate 2
    
    four_bitCSA CSA1(.A(A[11:8]), .B(B[11:8]), .cin1(ZERO),.cin2(ONE), .S1(Sone1[3:0]), .S2(Stwo1[3:0]), .Zero(c80), .One(c81)); // rewrite Sone and Stwo for outputs
    mux MUX1(.c0(c8), .S1(Sone1[3:0]), .S2(Stwo1[3:0]), .SF(SF[11:8]));
    gates GATE1(.c0(c8), .Zero(c80), .One(c81), .gate2(c12)); // so now c12 contains gate 2
    
    four_bitCSA CSA2(.A(A[15:12]), .B(B[15:12]), .cin1(ZERO),.cin2(ONE), .S1(Sone2[3:0]), .S2(Stwo2[3:0]), .Zero(c120), .One(c121));
    mux MUX2(.c0(c12), .S1(Sone2[3:0]), .S2(Stwo2[3:0]), .SF(SF[15:12]));
    gates GATE2(.c0(c12), .Zero(c120), .One(c121), .gate2(CoutF)); // so now CoutF contains gate 2
    
endmodule