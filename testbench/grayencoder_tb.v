module grayencoder_tb;
  reg [3:0] binary;
  wire [3:0] gray;
  integer i;
  gray_encoder uut(.binary(binary),.gray(gray));
  initial begin
    $dumpfile("grayencoder_tb.vcd");
    $dumpvars(0,grayencoder_tb);
    for(i=0;i<16;i=i+1) begin
      binary=i;
      #10;
    end
     $finish;
  end
endmodule
    