module fail_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:124999] /* synthesis ram_init_file = "./fail/fail.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
