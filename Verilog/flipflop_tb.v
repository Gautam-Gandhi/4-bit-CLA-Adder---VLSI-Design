`include "flipflop.v"
module tb_flip_flop;

reg in;
reg clk;
wire out;

flip_flop uut (
    .in(in),
    .clk(clk),
    .out(out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("flipflop.vcd");
    $dumpvars(0, tb_flip_flop);
    in = 0;
    #10;
    
    in = 1;
    #10;
    
    in = 0;
    #10;
    
    in = 1;
    #10;
    
    in = 0;
    #10;
    
    $finish;
end
endmodule