module fun_demux_tb;
  reg I;
  reg S1, S2, S3, S4;
  wire [15:0] O;

  fun_demux uut (
    .I(I),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .S4(S4),
    .O(O)
  );

  integer sel;

  initial begin
    $dumpfile("fun_demux_tb.vcd");
    $dumpvars(0, fun_demux_tb);

    I = 1;
    for (sel = 0; sel < 16; sel = sel + 1) begin
      {S1, S2, S3, S4} = sel;
      #10;
    end

    $finish;
  end
endmodule