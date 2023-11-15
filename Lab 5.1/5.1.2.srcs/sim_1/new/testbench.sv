module testbench(); // change the file to .sv 

timeunit 10ns; // amount of time represented by #1
timeprecision 1ns;

logic Clk; // input and output from multiplier. signals are local because multiplier will be instantiated as a submodule here
logic Reset, Run, Continue;
logic [15:0] SW; // I think we need to initialize MAR< MDR< IR< and PC too
logic [7:0] hex_seg, hex_segB;
logic [3:0] hex_grid, hex_gridB;
logic [15:0] PC_OUT, MAR_OUT, MDR_OUT, IR_OUT, Data_from_SRAM, Data_to_SRAM; // output for testbench to show that PC, MAR, MDR, IR are loaded and that PC is incremented

slc3_testtop  slc3_testtop (.*);


always begin : CLOCK_GENERATION
#1 Clk = ~Clk; // wait for a delay of 1 timeunit
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// This is the testing now:

initial begin: TEST_VECTORS
Reset = 0;
//SW = 16'b0000000000000000;
Run = 0;
Continue = 0;

#2 Reset = 1;
SW = 16'd0;
#2 Reset = 0;
#2 Run = 1;
#2 Run = 0;

#1 Continue = 1;

#16 Continue = 0;

#1 Continue = 1;

#16 Continue = 0; // I changed this, it was initially #5 and the rest blank
#1 Continue = 1;
#16 Continue = 0;
#1 Continue = 1;
#16 Continue = 0;

end
endmodule