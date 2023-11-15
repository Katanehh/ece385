
//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//------------------------------------------------------------------------------


module slc3(
	input logic [15:0] SW,
	input logic	Clk, Reset, Run, Continue,
	input logic [15:0] Data_from_SRAM,
	output logic OE, WE,
	output logic [7:0] hex_seg,
	output logic [3:0] hex_grid,
	output logic [7:0] hex_segB,
	output logic [3:0] hex_gridB,
	output logic [15:0] ADDR,
	output logic [15:0] Data_to_SRAM,
	output logic [15:0] PC_OUT, MAR_OUT, MDR_OUT, IR_OUT,
	// week 2
	output logic [15:0] ADDR_OUT, ALU_OUT, LED_OUT // recheck ADDR and ADDR_OUT
);

// Internal connections
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic [3:0] BUSMUX;
logic SR1MUX, SR2MUX; // MARMUX removed here
logic BEN_OUT, MIO_EN, DRMUX;
logic [1:0] PCMUX, ADDR2MUX, ALUK;
logic ADDR1MUX;
logic [15:0] MDR_In;
logic [3:0] hex_4[3:0]; 


HexDriver HexA ( // display MEM2IO
    .clk(Clk),
    .reset(Reset),
    .in({hex_4[3][3:0],  hex_4[2][3:0], hex_4[1][3:0], hex_4[0][3:0]}),
    .hex_seg(hex_seg),
    .hex_grid(hex_grid)
);

// You may use the second (right) HEX driver to display additional debug information
// For example, Prof. Cheng's solution code has PC being displayed on the right HEX


HexDriver HexB ( // display PC
    .clk(Clk),
    .reset(Reset),
    .in({PC_OUT[15:12],  PC_OUT[11:8], PC_OUT[7:4], PC_OUT[3:0]}),
    .hex_seg(hex_segB),
    .hex_grid(hex_gridB)
);

// Connect MAR to ADDR, which is also connected as an input into MEM2IO
//	MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
//	input into MDR)
//assign ADDR = {4'b0000, MAR_OUT}; // initially MAR -> MAR_OUT
assign ADDR = MAR_OUT;
assign MIO_EN = OE; // originally just OE

// Instantiate the rest of your modules here according to the block diagram of the SLC-3
// including your register file, ALU, etc..
datapath datapathweek2 (.*);

// Our I/O controller (note, this plugs into MDR/MAR)

Mem2IO memory_subsystem(
    .*, .Reset(Reset), .ADDR(ADDR), .Switches(SW),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]), 
    .Data_from_CPU(MDR_OUT), .Data_to_CPU(MDR_In), // Initially MDR -> MDR_OUT for Data_from_CPU
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// State machine, you need to fill in the code here as well
ISDU state_controller(
	.*, .Reset(Reset), .Run(Run), .Continue(Continue),
	.Opcode(IR_OUT[15:12]), .IR_5(IR_OUT[5]), .IR_11(IR_OUT[11]), // initially IR -> IR_OUT
   .Mem_OE(OE), .Mem_WE(WE)
);
	
endmodule