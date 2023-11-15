module PC
(
    input logic LD_PC, Reset, Clk, 
    //input logic [15:0] BUS_IN, ADDER_IN,  // DO THIS FOR 5.2
    input logic [15:0] PC_IN,
    output logic [15:0] PC_OUT
    );
    initial begin
    PC_OUT = 16'd0;
    end
    //logic [15:0] PC_NEXTIN; // increments PC
    //logic [15:0] PC_INTOUT; //internal out to do increments
    
    always_ff @ (posedge Clk) 
    begin
        if (Reset)
            PC_OUT <= 16'd0;
        else if (LD_PC)
            PC_OUT <= PC_IN;      
    end
  
    /*assign PC_INTOUT = PC_OUT;
  
  //POSSIBLE BUG
    always_comb
    begin
        PC_NEXTIN = PC_INTOUT + 1;
    end8*/
    
  //mux4 PCmux (.select(PCMUX), .A(), .B(), .C(PC_NEXTIN), .D(), .fourout(PC_OUT)); //ADD A AND B FOR 5.2
  
     
endmodule
