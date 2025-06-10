module decoder_tb;
  reg a, b, en;
  wire D0, D1, D2, D3;

  Decoder uut (
    .a(a), .b(b), .en(en),
    .D0(D0), .D1(D1), .D2(D2), .D3(D3)
  );

  integer i;

  initial begin
    $dumpfile("decoder_tb.vcd");
    $dumpvars(0, decoder_tb);

    en = 1;
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end

    en = 0;
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end

    $finish;
  end
endmodule