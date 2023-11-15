module datapath(
        input logic Clk, Reset,
        input logic LD_MAR, LD_IR, LD_PC, LD_MDR, //LD_LED,
        input logic [3:0] BUSMUX,/*GatePC, GateMDR, GateALU, GateMARMUX,*/ // we dont need MARMUX and ALU week 1
        input logic MIO_EN, 
        input logic [1:0] PCMUX,
        input logic [15:0] MDR_In,
        output logic [15:0] MAR_OUT, MDR_OUT, IR_OUT, PC_OUT //LED // idk how many bits is LED
        );
        
        logic [15:0] MDR_temp;
        logic [15:0] BUS;
        logic [15:0] PC_IN;
        
        
        //assign PC_OUT = PC_IN;
        reg_16 PC(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .Din(PC_IN), .Data_Out(PC_OUT)); // PC Register only
        reg_16 MDR(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .Din(MDR_temp), .Data_Out(MDR_OUT));
        reg_16 MAR(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .Din(BUS), .Data_Out(MAR_OUT));
        reg_16 IR(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .Din(BUS), .Data_Out(IR_OUT));
        muxbus busgates(.select(BUSMUX/*GatePC || GateMDR || GateALU || GateMARMUX*/), .A(PC_OUT), .B(), .C(MDR_OUT), .D(), .busout(BUS)); // we exclude ALU and MARMUX for week1, so no .D
        pcmux3 PC_MUX(.select(PCMUX), .A(PC_OUT), .B(BUS), .C(), .PC_MUX_OUT(PC_IN)); // OK SO .C is for the ADDER in week2 so we remove it first
        mux2 MDR_MUX(.select(MIO_EN), .A(BUS), .B(MDR_In), .twoout(MDR_temp));
        
        //MEM2IO is instantiated in the slc3 module
        
 /*  OK SO THIS MAY OR MAY NOT BE CORRECT FOR THE LED. PLEASE CHECK      
        always_ff @ (posedge Clk)
        begin
            
            if(LD_LED)
                begin
                    LED <= IR_OUT [15:0]; // idk how many bits tbh
                end
            else
              begin
                    LED <= 10'b0000000000;
                end
        end
                */ 
endmodule