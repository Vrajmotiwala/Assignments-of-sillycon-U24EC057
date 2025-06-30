module testbench;
  reg A,B,CLK,RES1,RES2;
  wire Qa, Qb;
  wire red, green, yellow;

  light_controller uut (
    .A(A), .B(B), .CLK(CLK),.RES1(RES1),.RES2(RES2),
    .Qa(Qa), .Qb(Qb)
  );


  assign red    = ~Qa & ~Qb;
  assign green  = ~Qa &  Qb;
  assign yellow =  Qa & ~Qb;

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
    A=0;B=0;
    #50;
    A=0;B=1;
    #10;
    A=1;B=0;
    #30;
    $finish;
  end
endmodule
