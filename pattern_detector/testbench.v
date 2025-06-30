// Code your testbench here
// or browse Examples
module testbench();
  reg CLK =0;
  reg RES =0;
  reg I;
  wire Qa,Qb,Y;
  wire A=Qa;
  wire B=Qb;
  pattern_detector uut(.RES(RES),
                       .A(A),
                       .B(B),
                       .Y(Y),
                       .I(I),
                       .Qa(Qa),
                       .Qb(Qb),
                       .CLK(CLK)
                   );
  
  reg [31:0] data = 32'b0001_0100_0000_0000_0101_0000_0000_0000;
  integer i;
  
  always #5 CLK = ~CLK;
  
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
        RES = 0;
    #12;       
    RES = 1;
    for (i=0;i<32;i++) begin
      I = data[i];
      #10;
    end
    $finish;
  end
endmodule