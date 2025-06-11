module mux_fun_tb;
  reg [15:0] I;
  reg S1, S2, S3, S4;
  wire O;

  mux_fun uut (
    .I(I),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .S4(S4),
    .O(O)
  );

  integer sel;

  initial begin
    $dumpfile("mux_fun_tb.vcd");
    $dumpvars(0, mux_fun_tb);

    I = 16'b1010101010101010; 

    for (sel = 0; sel < 16; sel = sel + 1) begin
      {S1, S2, S3, S4} = sel;
      #10;
    end

    $finish;
  end
endmodule