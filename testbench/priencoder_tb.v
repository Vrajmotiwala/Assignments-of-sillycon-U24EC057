// Code your testbench here
// or browse Examples
module encoder_tb;
  reg I1,I2,I3,I4;
  wire S1,S2,val;
  integer i;
  priencoder uut(
    .I1(I1),.I2(I2),.I3(I3),.I4(I4),.S1(S1),.S2(S2),.VAL(VAL));
  initial begin
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0,encoder_tb);
    for(i=0;i<16;i=i+1) begin
      {I4,I3,I2,I1}=i;
      #10;
    end
    $finish;
  end
endmodule
  