module clock_divider #(
    parameter DIVIDE_BY = 25000000  // Adjust the value to get the desired frequency
)(
    input logic clk_in,
    input logic reset,
    output logic clk_out
);
    localparam WIDTH = $clog2(DIVIDE_BY);
    reg [WIDTH-1:0] count = 0;
    reg clk_track = 0;

    always_ff @(posedge clk_in or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_track <= 0;
            clk_out <= 0;
        end else begin
            count <= count + 1;
            if (count >= DIVIDE_BY - 1) begin
                count <= 0;
                clk_track <= ~clk_track;
            end
            clk_out <= clk_track;
        end
    end
endmodule
