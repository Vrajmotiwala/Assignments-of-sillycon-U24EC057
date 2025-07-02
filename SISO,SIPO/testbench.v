// Code your testbench here
// or browse Examples
module testbench();
  reg CLK,si,RES;
  wire so;
  
  
  SISO uut(.CLK(CLK),
           .RES(RES),
           .si(si),
           .so(so));
  initial CLK=0;
  always #5 CLK=~CLK;
  
  initial begin
    CLK=0;
    RES=0;
    si=0;
  end
  
  
 initial begin
   $dumpfile("testbench.vcd");
   $dumpvars(0,testbench);
   
   
   RES=1;si=1;
   #40;
    RES=1;si=0;
   #20;
    RES=1;si=0;
   #40;
    RES=1;si=1;
   #20;
   $finish;
 end
endmodule
   
 