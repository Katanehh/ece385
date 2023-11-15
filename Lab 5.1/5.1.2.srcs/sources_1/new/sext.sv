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

module sext4
(
    input logic [4:0] IR,
    output logic [15:0] sextoutFOUR
);

    always_comb
    if (IR[4] == 1'd1)
        begin
            sextoutFOUR = {11'b11111111111, IR};
        end
    else
        begin
            sextoutFOUR = {11'b00000000000, IR};
        end
endmodule
