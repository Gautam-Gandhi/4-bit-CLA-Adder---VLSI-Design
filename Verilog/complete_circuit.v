`include "flipflop.v"
`include "cla.v"

module complete_circuit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    input wire clk,
    output wire [3:0] sum,
    output wire cout
);

wire [3:0] a_ff;
wire [3:0] b_ff;
wire cin_ff;
wire [3:0] cla_sum;
wire cla_cout;

flip_flop dff_a0 (.in(a[0]), .clk(clk), .out(a_ff[0]));
flip_flop dff_a1 (.in(a[1]), .clk(clk), .out(a_ff[1]));
flip_flop dff_a2 (.in(a[2]), .clk(clk), .out(a_ff[2]));
flip_flop dff_a3 (.in(a[3]), .clk(clk), .out(a_ff[3]));

flip_flop dff_b0 (.in(b[0]), .clk(clk), .out(b_ff[0]));
flip_flop dff_b1 (.in(b[1]), .clk(clk), .out(b_ff[1]));
flip_flop dff_b2 (.in(b[2]), .clk(clk), .out(b_ff[2]));
flip_flop dff_b3 (.in(b[3]), .clk(clk), .out(b_ff[3]));

flip_flop dff_cin (.in(cin), .clk(clk), .out(cin_ff));

cla_4bit cla (
    .a(a_ff),
    .b(b_ff),
    .cin(cin_ff),
    .sum(cla_sum),
    .cout(cla_cout)
);

flip_flop dff_sum0 (.in(cla_sum[0]), .clk(clk), .out(sum[0]));
flip_flop dff_sum1 (.in(cla_sum[1]), .clk(clk), .out(sum[1]));
flip_flop dff_sum2 (.in(cla_sum[2]), .clk(clk), .out(sum[2]));
flip_flop dff_sum3 (.in(cla_sum[3]), .clk(clk), .out(sum[3]));

flip_flop dff_cout (.in(cla_cout), .clk(clk), .out(cout));

endmodule