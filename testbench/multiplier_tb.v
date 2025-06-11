// Code your testbench here
// or browse Examples
module tb_multiplier;
  reg [7:0] a,b;
  wire [15:0] z;
  multiplier uut(.a(a),.b(b),.z(z));
  initial begin
    $dumpfile("tb_multiplier.vcd");
    $dumpvars(0,tb_multiplier);
    a=0;b=0;
    #50;
    a=8'd20;
    b=8'd21;
    #50;
    a=8'd210;
    b=8'd21;
    #50;
    a=8'd42;
    b=8'd92;
    #50;
    a=8'd4;
    b=8'd2;
    #50;
    $finish;
  end
endmodule