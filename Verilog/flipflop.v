module flip_flop (
    input wire in,
    input wire clk,
    output reg out
);

always @(posedge clk) begin
    out <= in;
end

endmodule