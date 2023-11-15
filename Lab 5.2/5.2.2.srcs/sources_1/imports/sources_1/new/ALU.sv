module ALU
(
    input logic [1:0] ALUK,
    input logic [15:0] A, B,
    output logic [15:0] ALU_OUT
    );
   always_comb
   begin
           unique case(ALUK)
            2'b00: ALU_OUT = A+B; // add
            2'b01: ALU_OUT = A&B; // and
            2'b10: ALU_OUT = ~A; // not 
            2'b11: ALU_OUT = A; // pass
        endcase
        end    
           
endmodule
