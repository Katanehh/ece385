module datapath(
        input logic Clk, Reset,
        input logic LD_MAR, LD_IR, LD_PC, LD_MDR, LD_REG, LD_BEN, LD_CC, LD_LED, // added LD_REG, LD_CC and LD_BEN. Please check with ISDU
        input logic SR1MUX, DRMUX, SR2MUX, // Select Signals for SR1 mux, and DR mux (Please Recheck for SR2 [2:0] since the select bit come from control - idk what it actually is)
        input logic [3:0] BUSMUX,
        input logic MIO_EN, 
        input logic [1:0] ADDR2MUX, 
        input logic ADDR1MUX, // Select Bits for ADDR1 and ADDR2 Mux
        input logic [1:0] ALUK, // ALUK select bit
        input logic [1:0] PCMUX,
        input logic [15:0] MDR_In,
        output logic BEN_OUT, // BEN output
        output logic [15:0] LED_OUT, // LED output
        output logic [15:0] MAR_OUT, MDR_OUT, IR_OUT, PC_OUT, ADDR_OUT, ALU_OUT // I used Adder_out as output instead of local cuz we use it in bus, same for ALU_OUT
        );
        //week 1
        logic [15:0] MDR_temp;
        logic [15:0] BUS;
        logic [15:0] PC_IN;
        //week 2
        logic [15:0] ADDR_IN1, ADDR_IN2; // Adder Logic except Adder_Out cuz we use in Bus (Correct me if wrong)
        logic [15:0] SEXT10_OUT, SEXT8_OUT, SEXT5_OUT, SEXT4_OUT; // SEXT Output
        logic [15:0] SR1_OUT, SR2_OUT; // SR1 and SR2 Output
        logic [2:0] SR1MUX_OUT, DRMUX_OUT; // MUX outputs for DR and SR1 at register file
        logic [15:0] SR2MUX_OUT; // Mux Outputs for SR2
        
        // Module Instantiation Week1 + Partial Week2
        
        reg_16 PC(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .Din(PC_IN), .Data_Out(PC_OUT)); // PC Register only
        reg_16 MDR(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .Din(MDR_temp), .Data_Out(MDR_OUT));
        reg_16 MAR(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .Din(BUS), .Data_Out(MAR_OUT));
        reg_16 IR(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .Din(BUS), .Data_Out(IR_OUT));
        muxbus busgates(.select(BUSMUX), .A(PC_OUT), .B(ADDR_OUT), .C(MDR_OUT), .D(ALU_OUT), .busout(BUS)); // ADDR_OUT is for GateMARMUX and ALU_OUT is for GateALU
        pcmux3 PC_MUX(.select(PCMUX), .A(PC_OUT), .B(BUS), .C(ADDR_OUT), .PC_MUX_OUT(PC_IN)); 
        mux2 MDR_MUX(.select(MIO_EN), .A(BUS), .B(MDR_In), .twoout(MDR_temp));
        
        // week 2   
        
        // SEXT
        sext10 sext10(.IR(IR_OUT[10:0]), .sextoutTEN(SEXT10_OUT));
        sext8 sext8(.IR(IR_OUT[8:0]), .sextoutEIGHT(SEXT8_OUT));
        sext5 sext5(.IR(IR_OUT[5:0]), .sextoutFIVE(SEXT5_OUT));
        sext4 sext4(.IR(IR_OUT[4:0]), .sextoutFOUR(SEXT4_OUT));
      
        // ADDER
        mux2 ADDR1_MUX(.select(ADDR1MUX), .A(PC_OUT), .B(SR1_OUT), .twoout(ADDR_IN1)); // Recheck with Mux description. Possible Flipped inputs
        mux4 ADDR2_MUX(.select(ADDR2MUX), .A(16'b0), .B(SEXT5_OUT), .C(SEXT8_OUT), .D(SEXT10_OUT), .fourout(ADDR_IN2)); // Recheck with MUX description. Possible Flipped inputs
        Adder Adder(.A(ADDR_IN1), .B(ADDR_IN2), .OUT(ADDR_OUT)); 
        
        // Status Registers
        mux2_3bits SR1_MUX(.select(SR1MUX), .A(IR_OUT[8:6]), .B(IR_OUT[11:9]), .twoout(SR1MUX_OUT)); // Where the Status Register is. Refer to ISA
        mux2 SR2_MUX(.select(SR2MUX), .A(SR2_OUT), .B(SEXT4_OUT), .twoout(SR2MUX_OUT)); // Select bit is IR[5] which is mode bit to identify if we should get second operand from register or immediate value (if 0 = register, else = immediate) (IR[4:0] is te immediate value) (IR[8:6] is register that has second operand)
        
        // Destination Registers
        mux2_3bits DR_MUX(.select(DRMUX), .A(IR_OUT[11:9]), .B(3'b111), .twoout(DRMUX_OUT));
        
        // Register File
        Register_File Register_File(.Clk(Clk), .Reset(Reset), .LD_Reg(LD_REG), .BUS_IN(BUS), .DRMUX_OUT(DRMUX_OUT), .SR1MUX_OUT(SR1MUX_OUT), .SR2(IR_OUT[2:0]), .SR1_OUT(SR1_OUT), .SR2_OUT(SR2_OUT)); // SR2 input is IR[2:00 the last 3 bits which contain SR2
        
        // ALU
        ALU ALU(.ALUK(ALUK), .A(SR1_OUT), .B(SR2MUX_OUT), .ALU_OUT(ALU_OUT)); 
        
        // Branch Enable
        BEN BEN(.Clk(Clk), .Reset(Reset), .LD_BEN(LD_BEN), .LD_CC(LD_CC), .BUS_IN(BUS), .IR_IN(IR_OUT), .BEN_OUT(BEN_OUT));
      
        // LED
        reg_16 LED(.Clk(Clk), .Reset(Reset), .Load(LD_LED), .Din(IR_OUT), .Data_Out(LED_OUT));
        
endmodule