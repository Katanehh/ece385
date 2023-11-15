module sext8
(
    input logic [8:0] IR,
    output logic [15:0] sextoutEIGHT
);

    always_comb
    if (IR[8] == 1'd1)
        begin
            sextoutEIGHT = {7'b1111111, IR};
        end
    else
        begin
            sextoutEIGHT = {7'b0000000, IR};
        end
endmodule