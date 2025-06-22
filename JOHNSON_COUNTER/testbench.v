// Code your testbench here
// or browse Examples
module testbench();
  reg CLK,CLR1,CLR2,CLR3,CLR4,PRE1,PRE2,PRE3,PRE4;
  wire Q1,Q2,Q3,Q4;
  
  JOHNSON_counter uut(.CLK(CLK),
                   .Q1(Q1),
                   .Q2(Q2),
                   .Q3(Q3),
                   .Q4(Q4),
                   .CLR1(CLR1),
                   .CLR2(CLR2),
                   .CLR3(CLR3),
                   .CLR4(CLR4),
                   .PRE1(PRE1),
                   .PRE2(PRE2),
                   .PRE3(PRE3),
                   .PRE4(PRE4));
  initial begin
    CLK=0;
    forever #5 CLK=~CLK;
  end
  
  initial begin
    CLR1=0;CLR2=0;CLR3=0;CLR4=0;
    PRE1=1;PRE2=1;PRE3=1;PRE4=1;
    #5;
    
    CLR1=1;CLR2=1;CLR3=1;CLR4=1;
    PRE1=1;PRE2=1;PRE3=1;PRE4=1;
  end
    
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    
    
    #100 $finish;
  end
endmodule