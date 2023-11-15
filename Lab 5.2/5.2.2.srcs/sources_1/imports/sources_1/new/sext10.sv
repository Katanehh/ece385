module sext10
(
    input logic [10:0] IR,
    output logic [15:0] sextoutTEN
);

    always_comb
    if (IR[10] == 1'd1)
        begin
            sextoutTEN = {5'b11111, IR};
        end
    else
        begin
            sextoutTEN = {5'b00000, IR};
        end
endmodule