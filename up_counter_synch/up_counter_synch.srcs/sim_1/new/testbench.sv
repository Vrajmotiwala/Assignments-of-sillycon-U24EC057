// Code your testbench here
// or browse Examples
module testbench();
  reg CLK;
  wire Q1,Q2,Q3;
  up_counter uut(.CLK(CLK),
                 .Q1(Q1),
                 .Q2(Q2),
                 .Q3(Q3));
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    CLK=0;
    forever #5 CLK=~CLK;
  end
  initial begin
    #80;
    $finish;
  end
endmodule