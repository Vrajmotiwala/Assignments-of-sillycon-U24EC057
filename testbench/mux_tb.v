// Code your testbench here
// or browse Examples
module mux_tb;
  reg A, B, C, D, S1, S2;
  wire O;

  mux uut (
    .A(A), .B(B), .C(C), .D(D), .S1(S1), .S2(S2), .O(O)
  );

  initial begin
    $dumpfile("mux_tb.vcd");
    $dumpvars(0, mux_tb);

    A=0; B=0; C=0; D=1; S1=0; S2=0; #10;
    A=1; B=0; C=0; D=0; S1=1; S2=0; #10;
    A=0; B=1; C=0; D=0; S1=0; S2=1; #10;
    A=0; B=0; C=1; D=0; S1=1; S2=1; #10;
    A=1; B=1; C=1; D=1; S1=0; S2=0; #10;

    $finish;
  end
endmodule