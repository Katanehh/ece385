module testbench(); // change the file to .sv 

timeunit 10ns; // amount of time represented by #1
timeprecision 1ns;

logic Clk; // input and output from multiplier. signals are local because multiplier will be instantiated as a submodule here
logic Reset, Run, Continue;
logic [15:0] SW; // I think we need to initialize MAR< MDR< IR< and PC too
logic [7:0] hex_seg, hex_segB;
logic [3:0] hex_grid, hex_gridB;
logic [15:0] PC_OUT, MAR_OUT, MDR_OUT, IR_OUT; // output for testbench to show that PC, MAR, MDR, IR are loaded and that PC is incremented
// week 2
logic [15:0] ADDR_OUT, ALU_OUT, LED_OUT; // recheck ADDR and ADDR_OUT
	
slc3_testtop  slc3_testtop (.*);


always begin : CLOCK_GENERATION
#1 Clk = ~Clk; // wait for a delay of 1 timeunit
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// This is the testing now:

initial begin: TEST_VECTORS
//Reset = 1'b0;
//Run = 1'b0;
//Continue = 1'b0;
//SW = 16'h005a;
//
//#2 Reset = 1'b1;
//#2 Reset = 1'b0;
//#10 Run = 1'b1;
//#1 Run = 1'b0;
//
//#1 SW = 16'h0003;
//
//#1000 Continue = 1'b1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;
//#1000 Continue = 1;
//#1 Continue = 0;

//#200 Continue = 1;
//#1 Continue = 0;
//#16 Continue = 0; // I changed this, it was initially #5 and the rest blank
//#1 Continue = 1;
//#16 Continue = 0;
//#1 Continue = 1;
//#16 Continue = 0;

// ------------------------------------ IO test 1 ---------------------------- 
// ------------------------------------ PASS ---------------------------------
//Reset = 1;
//Run = 0;
//Continue = 0;
//SW = 16'h3;
//
//#2 
//Run = 1;
//Reset = 0;
//SW = 16'h3;
//Continue = 0;
//
//#50
//SW = 16'h4;
//
//#100
//SW = 16'h8;
//
//#50
//SW = 16'hff;
// ------------------------------------ IO test 1 -----------------------------

// ------------------------------------ IO test 2 -----------------------------
// ------------------------------------ PASS ----------------------------------
//Reset = 1;
//Run = 0;
//Continue = 0;
//SW = 16'h6;
//
//#2 
//Run = 1;
//Reset = 0;
//SW = 16'h6;
//Continue = 0;
//
//// pause wait long enough to ensure enter the PSE instruction
//#100
//SW = 16'h0956;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
////#100
////Continue = 1;
////#1
////Continue = 0;
//
//#100
//SW = 16'hfb5a;
//#5
//Continue = 1;
//#1
//Continue = 0;

//#100
//Continue = 1;
//#1
//Continue = 0;

//#100
//SW = 16'hAAB;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#100
//Continue = 1;
//#1
//Continue = 0;
// ------------------------------------ IO test 2 -----------------------------

// ------------------------------------ IO test 3 -----------------------------
// ------------------------------------ PASS ----------------------------------
//Reset = 1;
//Run = 0;
//Continue = 0;
//SW = 16'hb;
//
//// 16'hd801
//#2 
//Run = 1;
//Reset = 0;
//Continue = 0;
//SW = 16'hb;
//
//// pause wait long enough to ensure enter the PSE instruction
//// 16'hdc02 
//#200
//SW = 16'h0;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//
// //16'hdc03 
//#200
////SW = 16'h1;
//#5
//Continue = 1;
//#1
//Continue = 0;

// 16'hdc04 
//#200
//SW = 16'h2;
//#5
//Continue = 1;
//#1
//Continue = 0;
// ------------------------------------ IO test 3 -----------------------------

// ------------------------------------ IO test 4 -----------------------------
// ------------------------------------ PASS ----------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'h9c;

// #2 
// Run = 1;
// Reset = 0;
// Continue = 0;
// SW = 16'h9c;
// ------------------------------------ IO test 4 -----------------------------

// ------------------------------------ IO test 5 -----------------------------
// ------------------------------------ PASS ----------------------------------
//Reset = 1;
//Run = 0;
//Continue = 0;
//SW = 16'h14;
//
//// expect: d9
//#2 
//Run = 1;
//Reset = 0;
//Continue = 0;
//SW = 16'h14;
//
//#100
//SW = 16'hffff;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#100
//SW = 16'hfffe;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#1000
//Continue = 1;
//#1
//Continue = 0;
//
//#1000
//Continue = 1;
//#1
//Continue = 0;
//
//// expect: 1
//#500
//SW = 16'h1;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#200
//SW = 16'h0;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#1000
//Continue = 1;
//#1
//Continue = 0;
// ------------------------------------ IO test 5 -----------------------------

// ------------------------------------ IO test 6 -----------------------------
// ------------------------------------ PASS ----------------------------------
//Reset = 1;
//Run = 0;
//Continue = 0;
//SW = 16'h31;
//
//// expect: 20f
//#2 
//Run = 1;
//Reset = 0;
//Continue = 0;
//SW = 16'h31;
//
//#500
//SW = 02;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#500
//SW = 03;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#2000
//Continue = 1;
//#1
//Continue = 0;
//
//#2000
//Continue = 1;
//#1
//Continue = 0;

// expect: 6
//#500
//SW = 10;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#500
//SW = 10;
//#5
//Continue = 1;
//#1
//Continue = 0;
//
//#2000
//Continue = 1;
//#1
//Continue = 0;
// ------------------------------------ IO test 6 -----------------------------

// ------------------------------------ IO test 8 -----------------------------
// ------------------------------------ PASS ----------------------------------
Reset = 1;
Run = 0;
Continue = 0;
SW = 16'h005a;
#50 
Run = 1;
Reset = 0;
#50 Run = 0;

Continue = 0;
SW = 16'h0003;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;

#200
Continue = 1;
#10
Continue = 0;



// ------------------------------------ IO test 8 -----------------------------
end
endmodule