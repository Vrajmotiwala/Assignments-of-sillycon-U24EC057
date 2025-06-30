module testbench;
  reg A,B,I,CLK,RES1,RES2;
  wire Qa, Qb;

  lift_controller uut (
    .A(A), .B(B), .CLK(CLK),.I(I),.RES1(RES1),.RES2(RES2),
    .Qa(Qa), .Qb(Qb)
  );


  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;  
  end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
  
  initial begin
    RES1 = 0;RES2=0;   
    #10;
    RES1 = 1;RES2=1;   
  end


  initial begin
    A=0;B=0;I=0;
    #20;
    A=0;B=0;I=1;
    #10;
    A=0;B=1;I=0;
    #10;
    A=0;B=1;I=1;
    #10;
    A=1;B=0;I=0;
    #10;
    A=1;B=0;I=1;
    #10;
    $finish;
  end
endmodule
