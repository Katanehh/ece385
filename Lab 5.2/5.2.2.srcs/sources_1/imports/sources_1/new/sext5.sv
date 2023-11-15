module sext5
(
    input logic [5:0] IR,
    output logic [15:0] sextoutFIVE
);

    always_comb
    if (IR[5] == 1'd1)
        begin
            sextoutFIVE = {10'b1111111111, IR};
        end
    else
        begin
            sextoutFIVE = {10'b0000000000, IR};
        end
endmodule