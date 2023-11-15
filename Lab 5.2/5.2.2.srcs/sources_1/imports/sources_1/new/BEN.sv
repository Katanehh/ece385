module BEN(
    input logic Clk, Reset, LD_BEN,LD_CC, 
    input logic [15:0] BUS_IN, IR_IN,
    output logic BEN_OUT
    );
    
    logic [2:0] nzp;
    logic [2:0] Status_Reg;
    logic N, Z, P, Branch;
    
    assign Status_Reg = IR_IN[11:9];
    
    always_ff @ (posedge Clk)
        begin
            if(Reset)
                begin
                BEN_OUT <= 16'h0000;
                end 
                
            else if(LD_BEN)
                begin
                BEN_OUT <= Branch;
                end 
                
            else if(LD_CC) // condition code
                begin
                nzp[2] <= N;
                nzp[1] <= Z;
                nzp[0] <= P; 
                end
        end
             
    always_comb
        begin
        Branch = ((nzp[2] & Status_Reg[2]) | (nzp[1] & Status_Reg[1]) | (nzp[0] & Status_Reg[0])); // checks if condition codes nzp match condition stored in status register, otherwise continue execution
        
         if (BUS_IN[15] == 1'b1) // Negative
            begin
            N = 1'b1;
            Z = 1'b0;
            P = 1'b0;
            end
         
         else if(BUS_IN == 16'h0000) // Zero
            begin
            N = 1'b0;
            Z = 1'b1;
            P = 1'b0;
            end
         
         else if(BUS_IN[15] == 0 && BUS_IN != 16'h0000) // Positive
            begin
            N = 1'b0;
            Z = 1'b0;
            P = 1'b1;
            end
            
         else // Unconditional Jump
            begin
            N = 1'b1;
            Z = 1'b1;
            P = 1'b1;
            end 
    
  // ASK TA if we need to add unconditional Jump when NZP = 111) Branch location determined by adding SEXT PC offset9 to PC
  // We can use else but we need to change the positive one from else to else if (BUS[15] = 0 and != 16'h0000) in otherwords positive non-zero
        end
    
endmodule
