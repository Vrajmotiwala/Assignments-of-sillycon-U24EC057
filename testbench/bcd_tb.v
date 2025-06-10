
  module bcd_encoder_tb;
  reg [3:0] Q;
  wire [7:0] Y;

  bcd_encoder uut (
    .Q(Q),
    .Y(Y)
  );

  initial begin
    $dumpfile("bcd_encoder_tb.vcd");
    $dumpvars(0, bcd_encoder_tb);

    Q = 0; #10;
    Q = 1; #10;
    Q = 2; #10;
    Q = 3; #10;
    Q = 4; #10;
    Q = 5; #10;
    Q = 6; #10;
    Q = 7; #10;
    Q = 8; #10;
    Q = 9; #10;
    Q = 10; #10;
    Q = 11; #10;
    Q = 12; #10;
    Q = 13; #10;
    Q = 14; #10;
    Q = 15; #10;

    $finish;
  end
endmodule