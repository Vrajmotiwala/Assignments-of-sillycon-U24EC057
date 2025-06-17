module booth_multiplier_32bit_tb();
  reg signed [31:0] M,q;
  wire signed [63:0] z;
  booth_multiplier_32 uut(
    .M(M),
    .q(q),
    .z(z)
  );
  initial begin
    $dumpfile("booth_multiplier_32bit_tb.vcd");
    $dumpvars(0,booth_multiplier_32bit_tb);
    M=32'd30;q=32'd21;
    #10;
    M=32'd32;q=32'd2;
    #10;
    M=32'd3;q=32'd11;
    #10;
    M=32'd13;q=32'd27;
    #10;
    M=32'd31;q=32'd40;
    #10;
    M=32'd3;q=32'd4;
    #10;
    $finish;
  end
endmodule
  