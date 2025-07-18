// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module encoder_tb;
  reg I1,I2,I3,I4,I5,I6,I7,I8;
  wire [2:0] D;
  wire val;
  integer i;
  fun_encoder uut(
    .I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.D(D),.val(val));
  initial begin
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0,encoder_tb);
    for(i=0;i<256;i=i+1) begin
      {I1,I2,I3,I4,I5,I6,I7,I8}=i;
      #10;
    end
    $finish;
  end
endmodule
  