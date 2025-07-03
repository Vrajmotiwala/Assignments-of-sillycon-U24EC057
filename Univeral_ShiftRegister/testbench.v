// Code your testbench here
// or browse Examples
module testbench;
  reg CLK, RES, si, S0, S1;
  reg I0, I1, I2, I3;
  wire Q0, Q1, Q2, Q3;

  uni_shiftregister uut (
    .I0(I0), .I1(I1), .I2(I2), .I3(I3),
    .CLK(CLK), .RES(RES), .si(si),
    .S0(S0), .S1(S1),
    .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3)
  );

  initial 
    CLK = 0;
  always #5 CLK=~CLK;
  
  initial begin
    RES=0;
    S0=0;
    S1=0;
    I0=0;
    I1=0;
    I2=0;
    I3=0;
    si=0;
  end
    
    

  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
 
     // Reset-sync
  RES = 0;
  @(negedge CLK);
  RES = 1;
  @(negedge CLK);

  // Parallel Load
  I0=1; I1=1; I2=0; I3=1; S1=1; S0=1;
  @(negedge CLK);

  // Hold
  S1=0; S0=0;
  @(negedge CLK);

  // Shift Right
  si=0; S1=0; S0=1;
  @(negedge CLK);

  // Shift Left
  si=1; S1=1; S0=0;
  @(negedge CLK);

  // Final Hold
  S1=0; S0=0;
  @(negedge CLK);
  $finish;
end
endmodule