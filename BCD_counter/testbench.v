// Code your testbench here
// or browse Examples
module testbench();
  reg CLK;
  wire Q1,Q2,Q3,Q4;
  
  BCD_counter uut(.CLK(CLK),
                   .Q1(Q1),
                   .Q2(Q2),
                   .Q3(Q3),
                   .Q4(Q4));
  initial begin
    CLK=0;
    forever #5 CLK=~CLK;
  end
  
    
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    
    
    #200 $finish;
  end
endmodule