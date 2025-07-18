// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module testbench();
  reg CLK,A,B,I;
  wire Qa,Qb,Y;
  
  moore_fsm uut(.CLK(CLK),
               .A(A),
               .B(B),
               .I(I),
               .Qa(Qa),
               .Qb(Qb),
               .Y(Y));
  initial begin
    CLK=0;
    forever #5 CLK=~CLK;
  end
  
  initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    A=1'b0;B=1'b0;I=1'b0;
    #20;
    A=1'b0;B=1'b0;I=1'b1;
    #20;
    A=1'b0;B=1'b1;I=1'b0;
    #20;
    A=1'b0;B=1'b1;I=1'b1;
    #20;
    A=1'b1;B=1'b0;I=1'b0;
    #20;
    A=1'b1;B=1'b0;I=1'b1;
    #20;
    A=1'b1;B=1'b1;I=1'b0;
    #20;
    A=1'b1;B=1'b1;I=1'b1;
    #20;
    $finish;
  end
endmodule