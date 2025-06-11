module fun_decode_tb;
  reg A, B, C;
  wire [7:0] D;

  fun_decode uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D)
  );

  initial begin
    $dumpfile("fun_decode_tb.vcd");
    $dumpvars(0, fun_decode_tb);

    A = 0; B = 0; C = 0; #10;
    A = 0; B = 0; C = 1; #10;
    A = 0; B = 1; C = 0; #10;
    A = 0; B = 1; C = 1; #10;
    A = 1; B = 0; C = 0; #10;
    A = 1; B = 0; C = 1; #10;
    A = 1; B = 1; C = 0; #10;
    A = 1; B = 1; C = 1; #10;

    $finish;
  end
endmodule