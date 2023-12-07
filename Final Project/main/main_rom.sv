module main_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:44999] /* synthesis ram_init_file = "./main/main.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
