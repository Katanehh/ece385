
module sext4(
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