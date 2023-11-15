module mux4
(
       input logic [1:0] select, //select bit
       input logic [15:0] A,
       input logic [15:0] B,
       input logic [15:0] C,
       input logic [15:0] D,
       output logic[15:0] fourout
    );
    always_comb
        begin
        unique case(select)
            2'b00: fourout = A;
            2'b01: fourout = B;
            2'b10: fourout = C;
            2'b11: fourout = D;
        endcase
        end
    
endmodule

module pcmux3 
(
       input logic [1:0] select, //select bit
       input logic [15:0] A,
       input logic [15:0] B,
       input logic [15:0] C,
       output logic[15:0] PC_MUX_OUT
    );
    

        
    always_comb
        begin
        case(select)
            2'b00: PC_MUX_OUT = A+16'd1;
            2'b01: PC_MUX_OUT = B;
            2'b10: PC_MUX_OUT = C;
            default : PC_MUX_OUT = A;
        endcase
        end
    
endmodule

module muxbus // we exclude the bus for ALU and MARMUX since week 1 no need
(
       input logic [3:0] select, //select bit
       input logic [15:0] A,
       input logic [15:0] B,
       input logic [15:0] C,
       input logic [15:0] D,
       output logic[15:0] busout
    );
    always_comb
        begin
        unique case(select)
            4'b0001: busout = A;
            4'b0010: busout = B;
            4'b0100: busout = C;
            4'b1000: busout = D;
            default: busout = 16'd0;
        endcase
        end
    
endmodule

module mux2
(
       input logic select, //select bit
       input logic [15:0] A,
       input logic [15:0] B,
       output logic[15:0] twoout
    );
    always_comb
        begin
        unique case(select)
            1'b0: twoout = A;
            1'b1: twoout = B;
        endcase
        end
    
endmodule

module mux2_3bits
(
       input logic select, //select bit
       input logic [2:0] A,
       input logic [2:0] B,
       output logic[2:0] twoout
    );
    always_comb
        begin
        unique case(select)
            1'b0: twoout = A;
            1'b1: twoout = B;
        endcase
        end
    
endmodule