`include "complete_circuit.v"
module tb_complete_circuit;

reg [3:0] a;
reg [3:0] b;
reg cin;
reg clk;
wire [3:0] sum;
wire cout;

complete_circuit uut (
    .a(a),
    .b(b),
    .cin(cin),
    .clk(clk),
    .sum(sum),
    .cout(cout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("complete_circuit.vcd");
    $dumpvars(0, tb_complete_circuit);

    a = 4'b0000; b = 4'b0000; cin = 0;
    #10;
    
    a = 4'b0001; b = 4'b0001; cin = 0;
    #10;
    
    a = 4'b0010; b = 4'b0011; cin = 0;
    #10;
    
    a = 4'b0100; b = 4'b0101; cin = 1;
    #10;
    
    a = 4'b0111; b = 4'b0111; cin = 0;
    #10;
    
    a = 4'b1111; b = 4'b1111; cin = 1;
    #10;
    
    $finish;
end

endmodule