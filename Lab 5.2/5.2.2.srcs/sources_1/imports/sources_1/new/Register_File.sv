module Register_File
(
    input logic Clk, Reset, LD_Reg,
    input logic [15:0] BUS_IN, // input from bus
    input logic [2:0] DRMUX_OUT, SR1MUX_OUT, SR2,
    output logic [15:0] SR1_OUT, SR2_OUT
    );
    
    logic [15:0] Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7;
    
    always_ff @ (posedge Clk)
        begin
               // Reset Values
                if(Reset) 
                    begin
                    Reg0 <= 16'h0000;
                    Reg1 <= 16'h0000;
                    Reg2 <= 16'h0000;
                    Reg3 <= 16'h0000;
                    Reg4 <= 16'h0000;
                    Reg5 <= 16'h0000;
                    Reg6 <= 16'h0000;
                    Reg7 <= 16'h0000;
                    
                    end
                // Loading Values
                else if(LD_Reg)
                    begin
                       case(DRMUX_OUT)
                       3'b000: Reg0 <= BUS_IN;
					   3'b001: Reg1 <= BUS_IN;
					   3'b010: Reg2 <= BUS_IN;
					   3'b011: Reg3 <= BUS_IN;
					   3'b100: Reg4 <= BUS_IN;
					   3'b101: Reg5 <= BUS_IN;
					   3'b110: Reg6 <= BUS_IN;
					   3'b111: Reg7 <= BUS_IN;
				       endcase
				     end
                                   
        end
  
   always_comb
        begin
           case(SR1MUX_OUT)
           3'b000: SR1_OUT = Reg0;
           3'b001: SR1_OUT = Reg1;
           3'b010: SR1_OUT = Reg2;
           3'b011: SR1_OUT = Reg3;
           3'b100: SR1_OUT = Reg4;
           3'b101: SR1_OUT = Reg5;
           3'b110: SR1_OUT = Reg6;
           3'b111: SR1_OUT = Reg7;
		   endcase
            
           case(SR2)
           3'b000: SR2_OUT = Reg0;
           3'b001: SR2_OUT = Reg1;
           3'b010: SR2_OUT = Reg2;
           3'b011: SR2_OUT = Reg3;
           3'b100: SR2_OUT = Reg4;
           3'b101: SR2_OUT = Reg5;
           3'b110: SR2_OUT = Reg6;
           3'b111: SR2_OUT = Reg7;
		   endcase
            
        end      
                    
endmodule
