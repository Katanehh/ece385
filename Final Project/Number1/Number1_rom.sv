module Number1_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:2499] /* synthesis ram_init_file = "./Number1/Number1.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
