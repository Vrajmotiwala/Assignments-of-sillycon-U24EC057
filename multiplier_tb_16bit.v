module multiplier_tb;
  reg [15:0] a,b;
  wire [31:0] z;
   
  multiplier2 uut(.a(a),.b(b),.z(z));
  initial begin
    $dumpfile("multiplier_tb.vcd");
    $dumpvars(0,multiplier_tb);
    a=0;b=0;
    #10;
    a=16'd20;b=16'd29;
    #10;
    a=16'd2;b=16'd29;
    #10;
    a=16'd200;b=16'd29;
    #10;
    a=16'd210;b=16'd2239;
    #10;
    a=16'd8;b=16'd2;
    #10;
    $finish;
  end
endmodule
    