// Code your testbench here
// or browse Examples
module testbench();
  reg clk,load,I1,I2,I3,I0;
  wire Q0,Q1,Q2,Q3;
  
  
  PISO uut(.clk(clk),
           .load(load),
           .I0(I0),
           .I1(I1),
           .I2(I2),
           .I3(I3),
           .Q0(Q0),
           .Q1(Q1),
           .Q2(Q2),
           .Q3(Q3));
  initial clk=0;
  always   #5 clk = ~clk;
  
  initial begin
    clk=0;
    load=0;
    I0=0;
    I1=0;
    I2=0;
    I3=0;
  end
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    
    I0=1;I1=1;I2=0;I3=0;load=1;
    #10;
    load=0;
    #5;
    I0=1;I1=1;I2=1;I3=0;load=1;
    #10;
    load=0;
    #5;
    I0=0;I1=0;I2=1;I3=1;load=1;
    #10;
    load=0;
    #5;
    I0=0;I1=1;I2=0;I3=1;load=1;
    #10;
    load=0;
    #5;
    $finish;
  end
endmodule