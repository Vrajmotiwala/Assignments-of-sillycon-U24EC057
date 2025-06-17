module booth_multiplier_tb();
  reg signed [7:0] M,q;
  wire signed [15:0] z;
  booth_multiplier uut(
    .M(M),
    .q(q),
    .z(z)
  );
  initial begin
    $dumpfile("booth_multiplier_tb.vcd");
    $dumpvars(0,booth_multiplier_tb);
    M=8'd3;q=8'd21;
    #10;
    M=8'd2;q=8'd2;
    #10;
    M=8'd3;q=8'd11;
    #10;
    M=8'd13;q=8'd7;
    #10;
    M=8'd3;q=8'd40;
    #10;
    $finish;
  end
endmodule
  