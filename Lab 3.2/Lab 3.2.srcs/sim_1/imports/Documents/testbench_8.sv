module testbench(); // change the file to .sv 

timeunit 10ns; // amount of time represented by #1
timeprecision 1ns;

logic Clk = 0; // input and output from multiplier. signals are local because multiplier will be instantiated as a submodule here
logic Reset_Clear, Run_Accumulate; 
						logic [15:0]			SW;
						logic sign_LED;
						//logic [16:0] Out;
                        logic   [7:0]   hex_segA;
                        logic   [3:0]   hex_gridA;
                        logic [15:0] S;
                        //logic [15:0] Out;
                        //logic [15:0] Sval;
                        logic [15:0] ans_1, ans_2;
                        //logic [15:0] Bval;
                        logic   [7:0]   hex_segB;
                        logic   [3:0]   hex_gridB;
//logic [7:0] D;
integer ErrorCnt = 0; // counter to count instances wher sumulation results do not match with expected results

adder_toplevel adder_toplevel(.*); // instantiate multiplier, make sure the singals match with the module here

always begin : CLOCK_GENERATION
#1 Clk = ~Clk; // wait for a delay of 1 timeunit
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// This is the testing now:

initial begin: TEST_VECTORS
Reset_Clear = 1;
//Aval = 8'h01;
//ClearA_LoadB = 0;
//Clear_XA = 0;
Run_Accumulate = 0;
SW = 16'h1111; // specify the input from switches
// include all the other inputs here (input only)

#2 Reset_Clear = 0;

#2  Run_Accumulate = 1;
//#2 ClearA_LoadB = 0; 
    //D = 8'h07;
//#2  Run = 1;

// and so on and so forth
//#2  Run = 0;
//example of testing if error happens or not

#3  Run_Accumulate = 0;
    ans_1 = (16'h1111); // example of expected result of 1st cycle
    if (S != ans_1)
    ErrorCnt++;
    //ans_B = (8'h63);
   // if (Bval != ans_B)
    //ErrorCnt++;
    
    
#2  SW = 16'h1111;
    Run_Accumulate = 1;
    
#2  Run_Accumulate = 0;
    ans_2 = (16'h2222); // example of expected result of 1st cycle
    if (S != ans_2)
    ErrorCnt++;
    //if (Bval != ans_B)
    //ErrorCnt++;*/
 
if (ErrorCnt == 0)
    $display("Success!"); // this will be in command line output of Modelsim
else
    $display("%d error(s) detected. Imagine lol!", ErrorCnt);

end
endmodule