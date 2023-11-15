module PC
(
    input logic LD_PC, Reset, Clk, 
    input logic [15:0] BUS_IN, ADDER_IN,  // DO THIS FOR 5.2
    input logic [15:0] PC_IN,
    output logic [15:0] PC_OUT
    );
    initial begin
    PC_OUT = 16'd0;
    end
    
    always_ff @ (posedge Clk) 
    begin
        if (Reset)
            PC_OUT <= 16'd0;
        else if (LD_PC)
            PC_OUT <= PC_IN;      
    end
        
endmodule
